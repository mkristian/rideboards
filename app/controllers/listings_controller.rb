class ListingsController < ApplicationController

  include Ixtlan::Controllers::SearchQuery

  cache_headers :private

  # GET /listings
  # GET /listings.xml
  def index
    @listings = query(Listing, :name, :email)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = Listing.get!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.get!(params[:id])
  end

  # POST /listings
  # POST /listings.xml
  def create
    @listing = Listing.new(params[:listing])
    @listing.current_user = current_user

    respond_to do |format|
      if @listing.save
        flash[:notice] = 'Listing was successfully created.'
        format.html { redirect_to(listing_url(@listing.id)) }
        format.xml  { render :xml => @listing, :status => :created, :location => listing_url(@listing.id) + ".xml" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.get!(params[:id])
    @listing.current_user = current_user

    respond_to do |format|
      if @listing.update(params[:listing]) or not @listing.dirty?
        flash[:notice] = 'Listing was successfully updated.'
        format.html { redirect_to(listing_url(@listing.id)) }
        format.xml  { render :xml => @listing }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.get(params[:id])
    @listing.current_user = current_user
    @listing.destroy if @listing

    respond_to do |format|
      flash[:notice] = 'Listing was successfully deleted.'
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
end
