class BoardsController < ApplicationController

  include Ixtlan::Controllers::SearchQuery
  # GET /boards
  # GET /boards.xml
  def index
    @boards = query(Board, :name, :fullname)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.xml
  def show
    @board = Board.get!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @board }
    end
  end

  # GET /boards/new
  # GET /boards/new.xml
  def new
    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @board }
    end
  end

  # GET /boards/1/edit
  def edit
    @board = Board.get!(params[:id])
  end

  # POST /boards
  # POST /boards.xml
  def create
    @board = Board.new(params[:board])
    @board.current_user = current_user

    respond_to do |format|
      if @board.save
        flash[:notice] = 'Board was successfully created.'
        format.html { redirect_to(board_url(@board.id)) }
        format.xml  { render :xml => @board, :status => :created, :location => board_url(@board.id) + ".xml" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.xml
  def update
    @board = Board.get!(params[:id])
    @board.current_user = current_user

    params[:board].delete(:listings)

    respond_to do |format|
      if @board.update(params[:board]) or not @board.dirty?
        flash[:notice] = 'Board was successfully updated.'
        format.html { redirect_to(board_url(@board.id)) }
        format.xml  { render :xml => @board }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.xml
  def destroy
    @board = Board.get(params[:id])
    @board.current_user = current_user
    @board.destroy if @board

    respond_to do |format|
      flash[:notice] = 'Board was successfully deleted.'
      format.html { redirect_to(boards_url) }
      format.xml  { head :ok }
    end
  end
end
