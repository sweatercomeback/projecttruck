class ProjectStepsController < ApplicationController
  layout 'standard'
  # GET /project_steps
  # GET /project_steps.xml
  def index
    @project_steps = ProjectStep.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_steps }
    end
  end

  # GET /project_steps/1
  # GET /project_steps/1.xml
  def show
    @project_step = ProjectStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_step }
    end
  end

  # GET /project_steps/new
  # GET /project_steps/new.xml
  def new
    @project_step = ProjectStep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_step }
    end
  end

  # GET /project_steps/1/edit
  def edit
    @project_step = ProjectStep.find(params[:id])
  end

  # POST /project_steps
  # POST /project_steps.xml
  def create
    @project_step = ProjectStep.new(params[:project_step])

    respond_to do |format|
      if @project_step.save
        flash[:notice] = 'ProjectStep was successfully created.'
        format.html { redirect_to(@project_step) }
        format.xml  { render :xml => @project_step, :status => :created, :location => @project_step }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_steps/1
  # PUT /project_steps/1.xml
  def update
    @project_step = ProjectStep.find(params[:id])

    respond_to do |format|
      if @project_step.update_attributes(params[:project_step])
        flash[:notice] = 'ProjectStep was successfully updated.'
        format.html { redirect_to(@project_step) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_steps/1
  # DELETE /project_steps/1.xml
  def destroy
    @project_step = ProjectStep.find(params[:id])
    @project_step.destroy

    respond_to do |format|
      format.html { redirect_to(project_steps_url) }
      format.xml  { head :ok }
    end
  end
end
