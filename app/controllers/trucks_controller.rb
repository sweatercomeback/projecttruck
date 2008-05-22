class TrucksController < ApplicationController
  layout 'standard'
  
  include GeoKit::Geocoders
 
  def index
    #breakpoint
    #as stands for "Advanced Search" if this value is 1 then this request is coming
    #from the user index page and we should show the advanced search screen.
    #If this value is 0 then it's a request coming from this action and we should show the results
    if params[:as] == "1"
      @makes = {}
      Make.find(:all).collect { |m| @makes[m.name] = m.id }
      @makes.store("Any Make",nil)
      @models = Model.find(:all, :conditions => ['parent_id = ?', params[:makes]], :order => "name")
      @transmissions = Transmission.find(:all)
      @engines = Engine.find(:all)
      @drives = Drive.find(:all)
      @fuels = Fuel.find(:all)
      @colors = Color.find(:all)
      @conditions = Condition.find(:all)
      @last_zip = cookies[:last_zip]
    elsif params[:as] == "0"
      cookies[:last_zip] = { :value => params[:zip], :expires => Time.now.next_year }
      
      @trucks = Truck.search(params[:makes],
                             params[:model_id],
                             params[:start_year],
                             params[:end_year],
                             params[:for_sale],
                             params[:zip],
                             params[:distance],
                             params[:price_min],
                             params[:price_max],
                             params[:only_price_listed],
                             params[:transmission_id],
                             params[:engine_id],
                             params[:drive_id],
                             params[:fuel_id],
                             params[:int_color_ids],
                             params[:ext_color_ids],
                             params[:doors],
                             params[:condition_id])
    elsif !params[:user_id].blank?
      @trucks = Truck.find_all_by_user_id(params[:user_id])
    else
      @trucks = Truck.find_all_by_user_id(session[:user_id])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trucks.to_xml }
      format.js { render :json => @trucks.to_json }
    end    
  end

  def show
    @truck = Truck.find_by_user_id_or_public(session[:user_id], params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @truck.to_xml }
      format.js  { render :json => @truck.to_json }
    end
  end

  def new
    @truck = Truck.new
    @makes = {}
    Make.find(:all).collect { |m| @makes[m.name] = m.id }
    @makes.store("<Select Make>",-1)
    @colors = Color.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @truck.to_xml }
      format.js  { render :json => @truck.to_json }
    end
  end

  # GET /trucks/1/edit
  def edit
    @truck = Truck.find_by_user_id_and_id(session[:user_id], params[:id])
    if @truck.nil?
      redirect_to "/"
      return
    end
    @makes = {}
    Make.find(:all, :order => "name").collect { |m| @makes[m.name] = m.id }
    @makes.store("<Select Make>",-1)
    @models = Model.find(:all, :conditions => ['parent_id = ?', @truck.model.parent_id], :order => "name")
    @colors = Color.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @truck.to_xml }
      format.js  { render :json => @truck.to_json }
    end
  end

  # POST /trucks
  # POST /trucks.xml
  def create
    @truck = Truck.new(params[:truck])
    @truck.user_id = session[:user_id]
    unless @truck.zip.blank?
      geoloc = MultiGeocoder.geocode(@truck.zip)
      @truck.lat = geoloc.lat
      @truck.lng = geoloc.lng  
    end
    
    respond_to do |format|
      if @truck.save
        flash[:notice] = 'Truck was successfully created.'
        format.html { redirect_to(@truck) }
        format.xml  { render :xml => @truck.to_xml, :status => :created, :location => @truck }
        format.js  { render :json => @truck.to_json, :status => :created, :location => @truck }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @truck.errors, :status => :unprocessable_entity }
        format.js  { render :json => @truck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trucks/1
  # PUT /trucks/1.xml
  def update
    #breakpoint
    @truck = Truck.find_by_user_id_and_id(session[:user_id], params[:id])
    redirect_to "/" unless !@truck.nil?
    unless params[:truck][:zip].blank?
      geoloc = MultiGeocoder.geocode(params[:truck][:zip])
      params[:truck][:lat] = geoloc.lat
      params[:truck][:lng ]= geoloc.lng
    end
    

    #edit photos
    params[:truck_photo_data].each do |tp|
      #breakpoint
      if tp[0] == "0"
        #new photo
        photo = Photo.create(:uploaded_data => tp[1])
        truck_photo = TruckPhoto.create(:truck => @truck, :photo => photo)
      elsif !tp[1].blank?
        truck_photo = TruckPhoto.find(tp[0].to_i)
        photo_id_to_destroy = truck_photo.photo.id
        truck_photo.photo = Photo.create(:uploaded_data => tp[1])
        truck_photo.save!
        Photo.find(photo_id_to_destroy).destroy
      end
    end
    
    respond_to do |format|
      if @truck.update_attributes(params[:truck])
        flash[:notice] = 'Truck was successfully updated.'
        format.html { redirect_to(@truck) }
        format.xml  { head :ok }
        format.js  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @truck.errors, :status => :unprocessable_entity }
        format.js  { render :json => @truck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.xml
  def destroy
    @truck = Truck.find_by_user_id_and_id(session[:user_id], params[:id])
    redirect_to "/" unless !@truck.nil?
    @truck.destroy

    respond_to do |format|
      format.html { redirect_to(trucks_url) }
      format.xml  { head :ok }
      format.js  { head :ok }
    end
  end
end
