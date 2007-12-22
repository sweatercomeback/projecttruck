class ProjectStepController < ApplicationController
layout 'login'

  def show
    
  end

  def edit
    
  end

  def update
  end

  def delete
  end

  def new
    session[:project_id] = params[:project_id]
    @project = Project.find(params[:project_id])
  end

  def create
    
    @project_step = ProjectStep.new(params[:project_step])
    @project_step.project_id = session[:project_id]
    #@project_step.text = params[:text]
    @project_step.project_photo_id = params[:photos]
    if @project_step.save
      redirect_to :controller => 'project', :action => 'edit', :id => session[:project_id]
    else
      
    end
  end
  
  def edit_step
    @project_step = ProjectStep.find(params[:ps_id])
    
    
    if @project_step.text.nil?
      html = "<textarea name='pstext'></textarea><select id='photos' name='photos'>"
      ProjectPhoto.find(:all, :conditions => ['project_id = ?', session[:project_id]]).each do |pp|
        html += "<option value='#{pp.id}'>#{pp.filename}</option>"
      end
    else
      html = "<textarea name='pstext'>" + @project_step.text + "</textarea><select id='photos' name='photos'>"
      ProjectPhoto.find(:all, :conditions => ['project_id = ?', session[:project_id]]).each do |pp|
        html += "<option value='#{pp.id}'>#{pp.filename}</option>"
      end
    end
    html += "</select>"
    render_text html
  end
  
  def cancel_step
    @project_step = ProjectStep.find(params[:ps_id])
    render_text @project_step.text
  end
  
  def save_step
    @project_step = ProjectStep.find(params[:ps_id])
    @project_step.text = params[:pstext]
    @project_step.project_photo_id = params[:photos]
    @project_step.save
    if @project_step.project_photo.nil?
      render_text @project_step.text      
    else
      render_text "<img src='#{@project_step.project_photo.public_filename}' />" + @project_step.text
    end
    
  end
end
