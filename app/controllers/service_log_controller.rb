class ServiceLogController < ApplicationController
layout 'standard'
before_filter :login_required

  def list
  end

  def show
    @service_log = ServiceLog.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
    @currUserID = session[:user].id
    @service_log = ServiceLog.new
    @my_trucks = Vehicle.find(:all, :conditions => ['user_id = ?', @currUserID])
  end

  def create
    @service_log = ServiceLog.new(params[:service_log])
    if @service_log.save
        redirect_to :controller => 'garage'
    else
        render :action => 'new'
    end    
  end

  def delete
  end
end
