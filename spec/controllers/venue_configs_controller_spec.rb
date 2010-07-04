require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
CONFIGURATION = Object.full_const_get(Ixtlan::Models::CONFIGURATION) unless Object.const_defined? "CONFIGURATION"
describe VenueConfigsController do

  def mock_venue_config(stubs={})
    @mock_venue_config ||= mock_model(VenueConfig, stubs)
  end

  def mock_array(*args)
    a = args
    def a.model
      VenueConfig
    end
    a
  end

  def mock_arguments(merge = {})
    args = merge
    args.merge!(:current_user= => nil, :errors => {})
    args.merge!(:model => VenueConfig, :key => 12)
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

    it "exposes all venue_configs as @venue_configs" do
      VenueConfig.should_receive(:all).and_return(mock_array(mock_venue_config))
      get :index
      assigns[:venue_configs].should == mock_array(mock_venue_config)
    end

    describe "with mime type of xml" do

      it "renders all venue_configses as xml" do
        VenueConfig.should_receive(:all).and_return(venue_configs = mock_array("Array of VenueConfigs"))
        venue_configs.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested venue_config as @venue_config" do
      VenueConfig.should_receive(:get!).with("37").and_return(mock_venue_config(mock_arguments))
      get :show, :id => "37"
      assigns[:venue_config].should equal(mock_venue_config)
    end

    describe "with mime type of xml" do

      it "renders the requested venue_config as xml" do
        VenueConfig.should_receive(:get!).with("37").and_return(mock_venue_config(mock_arguments))
        mock_venue_config.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new venue_config as @venue_config" do
      VenueConfig.should_receive(:new).and_return(mock_venue_config(mock_arguments))
      get :new
      assigns[:venue_config].should equal(mock_venue_config)
    end

  end

  describe "GET edit" do

    it "exposes the requested venue_config as @venue_config" do
      VenueConfig.should_receive(:get!).with("37").and_return(mock_venue_config(mock_arguments))
      get :edit, :id => "37"
      assigns[:venue_config].should equal(mock_venue_config)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created venue_config as @venue_config" do
        VenueConfig.should_receive(:new).with({'these' => 'params'}).and_return(mock_venue_config(mock_arguments(:save => true)))
        post :create, :venue_config => {:these => 'params'}
        assigns(:venue_config).should equal(mock_venue_config)
      end

      it "redirects to the created venue_config" do
        VenueConfig.stub!(:new).and_return(mock_venue_config(mock_arguments(:save => true)))
        post :create, :venue_config => {}
        response.should redirect_to(venue_config_url(mock_venue_config))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved venue_config as @venue_config" do
        VenueConfig.stub!(:new).with({'these' => 'params'}).and_return(mock_venue_config(mock_arguments(:save => false)))
        post :create, :venue_config => {:these => 'params'}
        assigns(:venue_config).should equal(mock_venue_config)
      end

      it "re-renders the 'new' template" do
        VenueConfig.stub!(:new).and_return(mock_venue_config(mock_arguments(:save => false)))
        post :create, :venue_config => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested venue_config" do
        VenueConfig.should_receive(:get!).with("37").and_return(mock_venue_config(mock_arguments))
        mock_venue_config.should_receive(:update).with({'these' => 'params'})
        mock_venue_config.should_receive(:dirty?)
        put :update, :id => "37", :venue_config => {:these => 'params'}
      end

      it "exposes the requested venue_config as @venue_config" do
        VenueConfig.stub!(:get!).and_return(mock_venue_config(mock_arguments(:update => true)))
        put :update, :id => "1"
        assigns(:venue_config).should equal(mock_venue_config)
      end

      it "redirects to the venue_config" do
        VenueConfig.stub!(:get!).and_return(mock_venue_config(mock_arguments(:update => true)))
        put :update, :id => "1"
        response.should redirect_to(venue_config_url(mock_venue_config))
      end

    end

    describe "with invalid params" do

      it "updates the requested venue_config" do
        VenueConfig.should_receive(:get!).with("37").and_return(mock_venue_config(mock_arguments))
        mock_venue_config.should_receive(:update).with({'these' => 'params'})
        mock_venue_config.should_receive(:dirty?)
        put :update, :id => "37", :venue_config => {:these => 'params'}
      end

      it "exposes the venue_config as @venue_config" do
        VenueConfig.stub!(:get!).and_return(mock_venue_config(mock_arguments(:update => false)))
        mock_venue_config.should_receive(:dirty?)
        put :update, :id => "1"
        assigns(:venue_config).should equal(mock_venue_config)
      end

      it "re-renders the 'edit' template" do
        VenueConfig.stub!(:get!).and_return(mock_venue_config(mock_arguments(:update => false, :dirty? => true)))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested venue_config" do
      VenueConfig.should_receive(:get).with("37").and_return(mock_venue_config(mock_arguments))
      mock_venue_config.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the venue_configs list" do
      VenueConfig.should_receive(:get).with("1").and_return(mock_venue_config(mock_arguments(:destroy => true)))
      delete :destroy, :id => "1"
      response.should redirect_to(venue_configs_url)
    end

  end

end
