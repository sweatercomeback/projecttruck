class VehiclePhotoController < ApplicationController
  layout 'popup'
  def index
    @vehicle_photos = VehiclePhoto.find(:all, :conditions => ['vehicle_id = ?', params[:vehicle_id]])
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def new
    @vehicle_photo = VehiclePhoto.new
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def show
    @vehicle_photo = VehiclePhoto.find params[:id]
  end

  def create
    @vehicle_photo = VehiclePhoto.create! params[:vehicle_photo]
    redirect_to :action => 'show', :id => @vehicle_photo
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end
  
  def delete
    @vehicle_photo = VehiclePhoto.find(params[:id])
    @vehicle_id = @vehicle_photo.vehicle_id
    @vehicle_photo.destroy
    redirect_to :action => 'index', :vehicle_id => @vehicle_id
  end
end
