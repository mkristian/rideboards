class PublicBoardsController < PublicController

  # GET /:lang/:venue/:boards
  def show
    render :template => "public/board"
  end
end
