require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
CONFIGURATION = Object.full_const_get(Ixtlan::Models::CONFIGURATION) unless Object.const_defined? "CONFIGURATION"
describe BoardsController do

  def mock_board(stubs={})
    @mock_board ||= mock_model(Board, stubs)
  end

  def mock_array(*args)
    a = args
    def a.model
      Board
    end
    a
  end

  def mock_arguments(merge = {})
    args = merge
    args.merge!(:current_user= => nil, :errors => {})
    args.merge!(:model => Board, :key => 12)
  args
  end

  before(:each) do
    user = Object.new
    def user.id; 1; end
    def user.login; "root"; end
    def user.groups
      g = Object.new
      def g.name; "root"; end
      [g]
    end
    controller.send(:current_user=, user)
    mock_configuration = mock_model(CONFIGURATION,{})
    CONFIGURATION.should_receive(:instance).any_number_of_times.and_return(mock_configuration)
    mock_configuration.should_receive(:session_idle_timeout).any_number_of_times.and_return(1)
  end

  describe "GET index" do

    it "exposes all boards as @boards" do
      Board.should_receive(:all).and_return(mock_array(mock_board))
      get :index
      assigns[:boards].should == mock_array(mock_board)
    end

    describe "with mime type of xml" do

      it "renders all boardses as xml" do
        Board.should_receive(:all).and_return(boards = mock_array("Array of Boards"))
        boards.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested board as @board" do
      Board.should_receive(:get!).with("37").and_return(mock_board(mock_arguments))
      get :show, :id => "37"
      assigns[:board].should equal(mock_board)
    end

    describe "with mime type of xml" do

      it "renders the requested board as xml" do
        Board.should_receive(:get!).with("37").and_return(mock_board(mock_arguments))
        mock_board.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new board as @board" do
      Board.should_receive(:new).and_return(mock_board(mock_arguments))
      get :new
      assigns[:board].should equal(mock_board)
    end

  end

  describe "GET edit" do

    it "exposes the requested board as @board" do
      Board.should_receive(:get!).with("37").and_return(mock_board(mock_arguments))
      get :edit, :id => "37"
      assigns[:board].should equal(mock_board)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created board as @board" do
        Board.should_receive(:new).with({'these' => 'params'}).and_return(mock_board(mock_arguments(:save => true)))
        post :create, :board => {:these => 'params'}
        assigns(:board).should equal(mock_board)
      end

      it "redirects to the created board" do
        Board.stub!(:new).and_return(mock_board(mock_arguments(:save => true)))
        post :create, :board => {}
        response.should redirect_to(board_url(mock_board))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved board as @board" do
        Board.stub!(:new).with({'these' => 'params'}).and_return(mock_board(mock_arguments(:save => false)))
        post :create, :board => {:these => 'params'}
        assigns(:board).should equal(mock_board)
      end

      it "re-renders the 'new' template" do
        Board.stub!(:new).and_return(mock_board(mock_arguments(:save => false)))
        post :create, :board => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested board" do
        Board.should_receive(:get!).with("37").and_return(mock_board(mock_arguments))
        mock_board.should_receive(:update).with({'these' => 'params'})
        mock_board.should_receive(:dirty?)
        put :update, :id => "37", :board => {:these => 'params'}
      end

      it "exposes the requested board as @board" do
        Board.stub!(:get!).and_return(mock_board(mock_arguments(:update => true)))
        put :update, :id => "1"
        assigns(:board).should equal(mock_board)
      end

      it "redirects to the board" do
        Board.stub!(:get!).and_return(mock_board(mock_arguments(:update => true)))
        put :update, :id => "1"
        response.should redirect_to(board_url(mock_board))
      end

    end

    describe "with invalid params" do

      it "updates the requested board" do
        Board.should_receive(:get!).with("37").and_return(mock_board(mock_arguments))
        mock_board.should_receive(:update).with({'these' => 'params'})
        mock_board.should_receive(:dirty?)
        put :update, :id => "37", :board => {:these => 'params'}
      end

      it "exposes the board as @board" do
        Board.stub!(:get!).and_return(mock_board(mock_arguments(:update => false)))
        mock_board.should_receive(:dirty?)
        put :update, :id => "1"
        assigns(:board).should equal(mock_board)
      end

      it "re-renders the 'edit' template" do
        Board.stub!(:get!).and_return(mock_board(mock_arguments(:update => false, :dirty? => true)))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested board" do
      Board.should_receive(:get).with("37").and_return(mock_board(mock_arguments))
      mock_board.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the boards list" do
      Board.should_receive(:get).with("1").and_return(mock_board(mock_arguments(:destroy => true)))
      delete :destroy, :id => "1"
      response.should redirect_to(boards_url)
    end

  end

end
