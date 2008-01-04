class PhotoController < ApplicationController
  layout 'popup'
  def index
    @user = User.find(session[:user_id])
  end

  def new
    
  end

  def show
    @photo = Photo.find params[:id]
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.user_id = session[:user_id]
    @photo.save
    
    redirect_to :action => 'show', :id => @photo
  end
  
  def delete
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to :action => 'index', :vehicle_id => session[:vehicle_id]
  end
end
