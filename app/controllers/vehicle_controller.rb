class VehicleController < ApplicationController
layout 'nustandard'

before_filter :login_required, :only=>['list', 'show', 'new', 'create', 'edit', 'update', 'delete']
after_filter :update_user_activity
include GeoKit::Geocoders

  def list
    @currUserID = session[:user_id]
    @vehicles = Vehicle.find(:all, :conditions => ['user_id = ?', @currUserID])
    @service_logs = ServiceLog.find_by_sql(['select service_logs.* from service_logs inner join vehicles on vehicles.id = service_logs.vehicle_id and vehicles.user_id = ?', @currUserID])
    @projects = Project.find(:all, :conditions => { :vehicle_id => @vehicle.id })
    
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @projects = Project.find(:all, :conditions => { :vehicle_id => @vehicle.id })

    
    respond_to do |format|
      format.html
      format.js
      format.xml { render :xml => @vehicle.to_xml }
    end
    
    
  end

  def new
    @vehicle = Vehicle.new
    @makes = {}
    Make.find(:all).collect { |m| @makes[m.name] = m.id }
    @makes.store("<Select Make>",-1)
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if params[:vehicle][:zipcode].blank?
      @vehicle.lat = @vehicle.user.lat
      @vehicle.lng = @vehicle.user.lng      
    else
      geoloc = MultiGeocoder.geocode(params[:vehicle][:zipcode])
      @vehicle.lat = geoloc.lat
      @vehicle.lng = geoloc.lng
    end
    @vehicle.user_id = session[:user_id]
    if @vehicle.save
        redirect_to :action => 'list'
    else
        render :action => 'new'
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    @makes = {}
    Make.find(:all, :order => "name").collect { |m| @makes[m.name] = m.id }
    @makes.store("<Select Make>",-1)
    @models = Model.find(:all, :conditions => ['parent_id = ?', @vehicle.model.parent_id], :order => "name")
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    if params[:vehicle][:zipcode].blank?
      @vehicle.lat = @vehicle.user.lat
      @vehicle.lng = @vehicle.user.lng      
    else
      geoloc = MultiGeocoder.geocode(params[:vehicle][:zipcode])
      @vehicle.lat = geoloc.lat
      @vehicle.lng = geoloc.lng
    end
    if @vehicle.update_attributes(params[:vehicle])
        redirect_to :action => 'show', :id => @vehicle
    else
        render :action => 'edit'    
    end
  end

  def delete
    Vehicle.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  def update_models
    make_id = request.raw_post.chop.to_i
    models = Model.find(:all, :conditions => ['parent_id = ?', make_id],:order => "name")
    select_html = "<select id='vehicle_model_id' name='vehicle[model_id]'>"
    models.each do |m|
      select_html += "<option value='#{m.id}'>#{m.name}&nbsp;</option>"
    end
    select_html += "</select>"
    render :text => select_html

  end



end
