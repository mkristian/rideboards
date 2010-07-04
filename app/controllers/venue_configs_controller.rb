class VenueConfigsController < ApplicationController

  # GET /venue_configs
  # GET /venue_configs.xml
  def index
    @venue_configs = VenueConfig.all()

    respond_to do |format|
      format.html
      format.xml  { render :xml => @venue_configs }
    end
  end

  # GET /venue_configs/1
  # GET /venue_configs/1.xml
  def show
    @venue_config = VenueConfig.get!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue_config }
    end
  end

  # GET /venue_configs/new
  # GET /venue_configs/new.xml
  def new
    @venue_config = VenueConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue_config }
    end
  end

  # GET /venue_configs/1/edit
  def edit
    @venue_config = VenueConfig.get!(params[:id])
  end

  # POST /venue_configs
  # POST /venue_configs.xml
  def create
    @venue_config = VenueConfig.new(params[:venue_config])
    @venue_config.current_user = current_user

    respond_to do |format|
      if @venue_config.save
        flash[:notice] = 'VenueConfig was successfully created.'
        format.html { redirect_to(venue_config_url(@venue_config.id)) }
        format.xml  { render :xml => @venue_config, :status => :created, :location => venue_config_url(@venue_config.id) + ".xml" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venue_configs/1
  # PUT /venue_configs/1.xml
  def update
    @venue_config = VenueConfig.get!(params[:id])
    @venue_config.current_user = current_user

    respond_to do |format|
      if @venue_config.update(params[:venue_config]) or not @venue_config.dirty?
        flash[:notice] = 'VenueConfig was successfully updated.'
        format.html { redirect_to(venue_config_url(@venue_config.id)) }
        format.xml  { render :xml => @venue_config }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venue_configs/1
  # DELETE /venue_configs/1.xml
  def destroy
    @venue_config = VenueConfig.get(params[:id])
    @venue_config.current_user = current_user
    @venue_config.destroy if @venue_config

    respond_to do |format|
      flash[:notice] = 'VenueConfig was successfully deleted.'
      format.html { redirect_to(venue_configs_url) }
      format.xml  { head :ok }
    end
  end
end
