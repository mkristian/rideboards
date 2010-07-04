require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
CONFIGURATION = Object.full_const_get(Ixtlan::Models::CONFIGURATION) unless Object.const_defined? "CONFIGURATION"
describe BoardConfigsController do

  def mock_board_config(stubs={})
    @mock_board_config ||= mock_model(BoardConfig, stubs)
  end

  def mock_array(*args)
    a = args
    def a.model
      BoardConfig
    end
    a
  end

  def mock_arguments(merge = {})
    args = merge
    args.merge!(:current_user= => nil, :errors => {})
    args.merge!(:model => BoardConfig, :key => 12)
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

    it "exposes all board_configs as @board_configs" do
      BoardConfig.should_receive(:all).and_return(mock_array(mock_board_config))
      get :index
      assigns[:board_configs].should == mock_array(mock_board_config)
    end

    describe "with mime type of xml" do

      it "renders all board_configses as xml" do
        BoardConfig.should_receive(:all).and_return(board_configs = mock_array("Array of BoardConfigs"))
        board_configs.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested board_config as @board_config" do
      BoardConfig.should_receive(:get!).with("37").and_return(mock_board_config(mock_arguments))
      get :show, :id => "37"
      assigns[:board_config].should equal(mock_board_config)
    end

    describe "with mime type of xml" do

      it "renders the requested board_config as xml" do
        BoardConfig.should_receive(:get!).with("37").and_return(mock_board_config(mock_arguments))
        mock_board_config.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new board_config as @board_config" do
      BoardConfig.should_receive(:new).and_return(mock_board_config(mock_arguments))
      get :new
      assigns[:board_config].should equal(mock_board_config)
    end

  end

  describe "GET edit" do

    it "exposes the requested board_config as @board_config" do
      BoardConfig.should_receive(:get!).with("37").and_return(mock_board_config(mock_arguments))
      get :edit, :id => "37"
      assigns[:board_config].should equal(mock_board_config)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created board_config as @board_config" do
        BoardConfig.should_receive(:new).with({'these' => 'params'}).and_return(mock_board_config(mock_arguments(:save => true)))
        post :create, :board_config => {:these => 'params'}
        assigns(:board_config).should equal(mock_board_config)
      end

      it "redirects to the created board_config" do
        BoardConfig.stub!(:new).and_return(mock_board_config(mock_arguments(:save => true)))
        post :create, :board_config => {}
        response.should redirect_to(board_config_url(mock_board_config))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved board_config as @board_config" do
        BoardConfig.stub!(:new).with({'these' => 'params'}).and_return(mock_board_config(mock_arguments(:save => false)))
        post :create, :board_config => {:these => 'params'}
        assigns(:board_config).should equal(mock_board_config)
      end

      it "re-renders the 'new' template" do
        BoardConfig.stub!(:new).and_return(mock_board_config(mock_arguments(:save => false)))
        post :create, :board_config => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested board_config" do
        BoardConfig.should_receive(:get!).with("37").and_return(mock_board_config(mock_arguments))
        mock_board_config.should_receive(:update).with({'these' => 'params'})
        mock_board_config.should_receive(:dirty?)
        put :update, :id => "37", :board_config => {:these => 'params'}
      end

      it "exposes the requested board_config as @board_config" do
        BoardConfig.stub!(:get!).and_return(mock_board_config(mock_arguments(:update => true)))
        put :update, :id => "1"
        assigns(:board_config).should equal(mock_board_config)
      end

      it "redirects to the board_config" do
        BoardConfig.stub!(:get!).and_return(mock_board_config(mock_arguments(:update => true)))
        put :update, :id => "1"
        response.should redirect_to(board_config_url(mock_board_config))
      end

    end

    describe "with invalid params" do

      it "updates the requested board_config" do
        BoardConfig.should_receive(:get!).with("37").and_return(mock_board_config(mock_arguments))
        mock_board_config.should_receive(:update).with({'these' => 'params'})
        mock_board_config.should_receive(:dirty?)
        put :update, :id => "37", :board_config => {:these => 'params'}
      end

      it "exposes the board_config as @board_config" do
        BoardConfig.stub!(:get!).and_return(mock_board_config(mock_arguments(:update => false)))
        mock_board_config.should_receive(:dirty?)
        put :update, :id => "1"
        assigns(:board_config).should equal(mock_board_config)
      end

      it "re-renders the 'edit' template" do
        BoardConfig.stub!(:get!).and_return(mock_board_config(mock_arguments(:update => false, :dirty? => true)))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested board_config" do
      BoardConfig.should_receive(:get).with("37").and_return(mock_board_config(mock_arguments))
      mock_board_config.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the board_configs list" do
      BoardConfig.should_receive(:get).with("1").and_return(mock_board_config(mock_arguments(:destroy => true)))
      delete :destroy, :id => "1"
      response.should redirect_to(board_configs_url)
    end

  end

end
