class TrucksController < ApplicationController
  layout 'standard'

  def index
    @trucks = Truck.find_all_by_user_id(session[:user_id])

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
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @truck.to_xml }
      format.js  { render :json => @truck.to_json }
    end
  end

  # GET /trucks/1/edit
  def edit
    @truck = Truck.find_by_user_id_and_id(session[:user_id], params[:id])

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
    @truck.destroy

    respond_to do |format|
      format.html { redirect_to(trucks_url) }
      format.xml  { head :ok }
      format.js  { head :ok }
    end
  end
  
  def update_models
    make_id = request.raw_post.chop.to_i
    models = Model.find(:all, :conditions => ['parent_id = ?', make_id],:order => "name")
    select_html = "<select id='model_id' name='truck[model_id]'>"
    models.each do |m|
      select_html += "<option value='#{m.id}'>#{m.name}&nbsp;</option>"
    end
    select_html += "</select>"
    render :text => select_html

  end
end
