class ProjectPhotoController < ApplicationController
  def index
    @project_photos = ProjectPhoto.find(:all, :conditions => ['project_id = ?', params[:project_id]])
    @project = Project.find(params[:project_id])
  end

  def new
    @project_photo = ProjectPhoto.new
    @project = Project.find(params[:project_id])
  end

  def show
    @project_photo = ProjectPhoto.find params[:id]
  end

  def create
    #@project_photo = ProjectPhoto.create! params[:project_photo]
    @project_photo = ProjectPhoto.new(params[:project_photo])
    @project_photo.parent_id = nil
    @project_photo.save
    
    redirect_to :action => 'show', :id => @project_photo
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end
  
  def delete
    @project_photo = ProjectPhoto.find(params[:id])
    @project_id = @project_photo.project_id
    @project_photo.destroy
    redirect_to :action => 'index', :project_id => @project_id
  end
end
