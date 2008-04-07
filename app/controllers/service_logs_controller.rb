class ServiceLogsController < ApplicationController
  layout 'standard'
  # GET /service_logs
  # GET /service_logs.xml
  def index
    @truck = Truck.find(params[:truck_id])
    @service_logs = ServiceLog.find_by_truck_id(params[:truck_id])

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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_log }
    end
  end

  # GET /service_logs/1/edit
  def edit
    @service_log = ServiceLog.find(params[:id])
  end

  # POST /service_logs
  # POST /service_logs.xml
  def create
    @service_log = ServiceLog.new(params[:service_log])

    respond_to do |format|
      if @service_log.save
        flash[:notice] = 'ServiceLog was successfully created.'
        format.html { redirect_to(@service_log) }
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

    respond_to do |format|
      if @service_log.update_attributes(params[:service_log])
        flash[:notice] = 'ServiceLog was successfully updated.'
        format.html { redirect_to(@service_log) }
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
      format.html { redirect_to(service_logs_url) }
      format.xml  { head :ok }
    end
  end
end
