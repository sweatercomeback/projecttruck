class VehiclePhotoController < ApplicationController
  layout 'popup'
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    session[:vehicle_id] = params[:vehicle_id]
  end

  def show
    @vehicle_photo = Photo.find params[:id]
  end

  def create
    @vehicle = Vehicle.find(session[:vehicle_id])
    @photo = Photo.new(params[:photo])
    @photo.save
    @vehicle.photos << @photo
    
    redirect_to :action => 'show', :id => @photo
  end
  
  def delete
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to :action => 'index', :vehicle_id => session[:vehicle_id]
  end
end
