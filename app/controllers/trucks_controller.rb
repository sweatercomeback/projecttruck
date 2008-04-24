class TrucksController < ApplicationController
  layout 'standard'
 
  def index
    #as stands for "Advanced Search" if this value is 1 then this request is coming
    #from the user index page and we should show the advanced search screen.
    #If this value is 0 then it's a request coming from this action and we should show the results
    if params[:as] == "1"
      @makes = {}
      Make.find(:all).collect { |m| @makes[m.name] = m.id }
      @makes.store("Any Make",-1)
      @models = Model.find(:all, :conditions => ['parent_id = ?', params[:makes]], :order => "name")
    elsif params[:as] == "0"
      finder = RecordFinder.new
      finder.add "public = 1" #only search trucks with public flag
      
      if params[:makes].to_i > 0
        finder.add "truck_attributes.parent_id = ?", params[:makes]
      end
      
      if params[:model_id].to_i > 0
        finder.add "model_id = ?", params[:model_id]
      end
      
      if !params[:start_year].blank?
        finder.add "year >= ?", params[:start_year]
      end
      
      if !params[:end_year].blank?
        finder.add "year <= ?", params[:end_year]
      end
      
      if params.include?(:for_sale) && params[:for_sale] == "1"
        finder.add "for_sale = 1"
      end
      
      @trucks = Truck.find(:all, :include => 'model', :conditions => finder.to_conditions)
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
    @truck = Truck.find_by_user_id_and_id(session[:user_id], params[:id])
    redirect_to "/" unless !@truck.nil?
    
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
