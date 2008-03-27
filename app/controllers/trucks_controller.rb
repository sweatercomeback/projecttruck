class TrucksController < ApplicationController
  # GET /trucks
  # GET /trucks.xml
  def index
    @trucks = Truck.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trucks }
    end
  end

  # GET /trucks/1
  # GET /trucks/1.xml
  def show
    @truck = Truck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @truck }
    end
  end

  # GET /trucks/new
  # GET /trucks/new.xml
  def new
    @truck = Truck.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @truck }
    end
  end

  # GET /trucks/1/edit
  def edit
    @truck = Truck.find(params[:id])
  end

  # POST /trucks
  # POST /trucks.xml
  def create
    @truck = Truck.new(params[:truck])

    respond_to do |format|
      if @truck.save
        flash[:notice] = 'Truck was successfully created.'
        format.html { redirect_to(@truck) }
        format.xml  { render :xml => @truck, :status => :created, :location => @truck }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @truck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trucks/1
  # PUT /trucks/1.xml
  def update
    @truck = Truck.find(params[:id])

    respond_to do |format|
      if @truck.update_attributes(params[:truck])
        flash[:notice] = 'Truck was successfully updated.'
        format.html { redirect_to(@truck) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @truck.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.xml
  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy

    respond_to do |format|
      format.html { redirect_to(trucks_url) }
      format.xml  { head :ok }
    end
  end
end
