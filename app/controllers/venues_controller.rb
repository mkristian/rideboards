class VenuesController < ApplicationController

  # GET /venues
  # GET /venues.xml
  def index
    @venues = Venue.all()

    respond_to do |format|
      format.html
      format.xml  { render :xml => @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.xml
  def show
    @venue = Venue.get!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.xml
  def new
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.get!(params[:id])
  end

  # POST /venues
  # POST /venues.xml
  def create
    @venue = Venue.new(params[:venue])
    @venue.current_user = current_user

    respond_to do |format|
      if @venue.save
        flash[:notice] = 'Venue was successfully created.'
        format.html { redirect_to(venue_url(@venue.id)) }
        format.xml  { render :xml => @venue, :status => :created, :location => venue_url(@venue.id) + ".xml" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.xml
  def update
    @venue = Venue.get!(params[:id])
    @venue.current_user = current_user

    respond_to do |format|
      if @venue.update(params[:venue]) or not @venue.dirty?
        flash[:notice] = 'Venue was successfully updated.'
        format.html { redirect_to(venue_url(@venue.id)) }
        format.xml  { render :xml => @venue }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.xml
  def destroy
    @venue = Venue.get(params[:id])
    @venue.current_user = current_user
    @venue.destroy if @venue

    respond_to do |format|
      flash[:notice] = 'Venue was successfully deleted.'
      format.html { redirect_to(venues_url) }
      format.xml  { head :ok }
    end
  end
end
