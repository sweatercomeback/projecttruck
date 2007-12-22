class ProjectController < ApplicationController
layout 'standard'

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @step_count = 1
    @currUserID = session[:user].id
    @project = Project.find(params[:id])
    session[:project_id] = params[:id]
    @project_photos = {}
    @project.project_photos.collect { |pp| @project_photos[pp.filename] = pp.id }
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
        redirect_to :action => 'show', :id => @project
    else
        render :action => 'edit'    
    end    
  end

  def delete
    @project = Project.find(params[:id]).destroy
    redirect_to :controller => 'vehicle', :action => 'list'
  end

  def new
    @currUserID = session[:user].id
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
        redirect_to :action => 'edit', :id => @project.id
    else
        render :action => 'new'
    end
  end
  
  def add_step
    render :partial => 'add_step_input'
  end


end
