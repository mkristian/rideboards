class BoardConfigsController < ApplicationController

  # GET /board_configs
  # GET /board_configs.xml
  def index
    @board_configs = BoardConfig.all()

    respond_to do |format|
      format.html
      format.xml  { render :xml => @board_configs }
    end
  end

  # GET /board_configs/1
  # GET /board_configs/1.xml
  def show
    @board_config = BoardConfig.get!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @board_config }
    end
  end

  # GET /board_configs/new
  # GET /board_configs/new.xml
  def new
    @board_config = BoardConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @board_config }
    end
  end

  # GET /board_configs/1/edit
  def edit
    @board_config = BoardConfig.get!(params[:id])
  end

  # POST /board_configs
  # POST /board_configs.xml
  def create
    @board_config = BoardConfig.new(params[:board_config])
    @board_config.current_user = current_user

    respond_to do |format|
      if @board_config.save
        flash[:notice] = 'BoardConfig was successfully created.'
        format.html { redirect_to(board_config_url(@board_config.id)) }
        format.xml  { render :xml => @board_config, :status => :created, :location => board_config_url(@board_config.id) + ".xml" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @board_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /board_configs/1
  # PUT /board_configs/1.xml
  def update
    @board_config = BoardConfig.get!(params[:id])
    @board_config.current_user = current_user

    respond_to do |format|
      if @board_config.update(params[:board_config]) or not @board_config.dirty?
        flash[:notice] = 'BoardConfig was successfully updated.'
        format.html { redirect_to(board_config_url(@board_config.id)) }
        format.xml  { render :xml => @board_config }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @board_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /board_configs/1
  # DELETE /board_configs/1.xml
  def destroy
    @board_config = BoardConfig.get(params[:id])
    @board_config.current_user = current_user
    @board_config.destroy if @board_config

    respond_to do |format|
      flash[:notice] = 'BoardConfig was successfully deleted.'
      format.html { redirect_to(board_configs_url) }
      format.xml  { head :ok }
    end
  end
end
