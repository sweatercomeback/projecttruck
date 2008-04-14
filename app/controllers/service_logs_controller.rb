class ServiceLogsController < ApplicationController
  layout 'standard'
  before_filter :verify_truck_owner
  
  
  # GET /service_logs
  # GET /service_logs.xml
  def index
    @truck = Truck.find(params[:truck_id])
    @service_logs = ServiceLog.find_all_by_truck_id(params[:truck_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_logs }
    end
  end

  # GET /service_logs/1
  # GET /service_logs/1.xml
  def show
    @service_log = ServiceLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_log }
    end
  end

  # GET /service_logs/new
  # GET /service_logs/new.xml
  def new
    @service_log = ServiceLog.new
    @service_log.truck = Truck.find(params[:truck_id])
    @service_log_types = ServiceLogType.find(:all, :order => 'name')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_log }
    end
  end

  # GET /service_logs/1/edit
  def edit
    @service_log = ServiceLog.find(params[:id])
    @service_log.truck = Truck.find(params[:truck_id])
    @service_log_types = ServiceLogType.find(:all, :order => 'name')
  end

  # POST /service_logs
  # POST /service_logs.xml
  def create
    @service_log = ServiceLog.new(params[:service_log])
    @service_log_types = ServiceLogType.find(:all, :order => 'name')

    respond_to do |format|
      if @service_log.save
        flash[:notice] = 'ServiceLog was successfully created.'
        format.html { redirect_to truck_service_log_path(:id => @service_log, :truck_id => @service_log.truck) }
        format.xml  { render :xml => @service_log, :status => :created, :location => @service_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_logs/1
  # PUT /service_logs/1.xml
  def update
    @service_log = ServiceLog.find(params[:id])
    @service_log_types = ServiceLogType.find(:all, :order => 'name') 

    respond_to do |format|
      if @service_log.update_attributes(params[:service_log])
        flash[:notice] = 'ServiceLog was successfully updated.'
        format.html { redirect_to truck_service_log_path(:id => @service_log, :truck_id => @service_log.truck) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_logs/1
  # DELETE /service_logs/1.xml
  def destroy
    @service_log = ServiceLog.find(params[:id])
    @service_log.destroy

    respond_to do |format|
      format.html { redirect_to(truck_service_logs_path(params[:truck_id])) }
      format.xml  { head :ok }
    end
  end
  
protected

  def verify_truck_owner
    redirect_to "/" unless !Truck.find_by_user_id(session[:user_id]).nil?
  end

end
