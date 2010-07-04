require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
CONFIGURATION = Object.full_const_get(Ixtlan::Models::CONFIGURATION) unless Object.const_defined? "CONFIGURATION"
describe VenuesController do

  def mock_venue(stubs={})
    @mock_venue ||= mock_model(Venue, stubs)
  end

  def mock_array(*args)
    a = args
    def a.model
      Venue
    end
    a
  end

  def mock_arguments(merge = {})
    args = merge
    args.merge!(:current_user= => nil, :errors => {})
    args.merge!(:model => Venue, :key => 12)
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

    it "exposes all venues as @venues" do
      Venue.should_receive(:all).and_return(mock_array(mock_venue))
      get :index
      assigns[:venues].should == mock_array(mock_venue)
    end

    describe "with mime type of xml" do

      it "renders all venueses as xml" do
        Venue.should_receive(:all).and_return(venues = mock_array("Array of Venues"))
        venues.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested venue as @venue" do
      Venue.should_receive(:get!).with("37").and_return(mock_venue(mock_arguments))
      get :show, :id => "37"
      assigns[:venue].should equal(mock_venue)
    end

    describe "with mime type of xml" do

      it "renders the requested venue as xml" do
        Venue.should_receive(:get!).with("37").and_return(mock_venue(mock_arguments))
        mock_venue.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new venue as @venue" do
      Venue.should_receive(:new).and_return(mock_venue(mock_arguments))
      get :new
      assigns[:venue].should equal(mock_venue)
    end

  end

  describe "GET edit" do

    it "exposes the requested venue as @venue" do
      Venue.should_receive(:get!).with("37").and_return(mock_venue(mock_arguments))
      get :edit, :id => "37"
      assigns[:venue].should equal(mock_venue)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created venue as @venue" do
        Venue.should_receive(:new).with({'these' => 'params'}).and_return(mock_venue(mock_arguments(:save => true)))
        post :create, :venue => {:these => 'params'}
        assigns(:venue).should equal(mock_venue)
      end

      it "redirects to the created venue" do
        Venue.stub!(:new).and_return(mock_venue(mock_arguments(:save => true)))
        post :create, :venue => {}
        response.should redirect_to(venue_url(mock_venue))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved venue as @venue" do
        Venue.stub!(:new).with({'these' => 'params'}).and_return(mock_venue(mock_arguments(:save => false)))
        post :create, :venue => {:these => 'params'}
        assigns(:venue).should equal(mock_venue)
      end

      it "re-renders the 'new' template" do
        Venue.stub!(:new).and_return(mock_venue(mock_arguments(:save => false)))
        post :create, :venue => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested venue" do
        Venue.should_receive(:get!).with("37").and_return(mock_venue(mock_arguments))
        mock_venue.should_receive(:update).with({'these' => 'params'})
        mock_venue.should_receive(:dirty?)
        put :update, :id => "37", :venue => {:these => 'params'}
      end

      it "exposes the requested venue as @venue" do
        Venue.stub!(:get!).and_return(mock_venue(mock_arguments(:update => true)))
        put :update, :id => "1"
        assigns(:venue).should equal(mock_venue)
      end

      it "redirects to the venue" do
        Venue.stub!(:get!).and_return(mock_venue(mock_arguments(:update => true)))
        put :update, :id => "1"
        response.should redirect_to(venue_url(mock_venue))
      end

    end

    describe "with invalid params" do

      it "updates the requested venue" do
        Venue.should_receive(:get!).with("37").and_return(mock_venue(mock_arguments))
        mock_venue.should_receive(:update).with({'these' => 'params'})
        mock_venue.should_receive(:dirty?)
        put :update, :id => "37", :venue => {:these => 'params'}
      end

      it "exposes the venue as @venue" do
        Venue.stub!(:get!).and_return(mock_venue(mock_arguments(:update => false)))
        mock_venue.should_receive(:dirty?)
        put :update, :id => "1"
        assigns(:venue).should equal(mock_venue)
      end

      it "re-renders the 'edit' template" do
        Venue.stub!(:get!).and_return(mock_venue(mock_arguments(:update => false, :dirty? => true)))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested venue" do
      Venue.should_receive(:get).with("37").and_return(mock_venue(mock_arguments))
      mock_venue.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the venues list" do
      Venue.should_receive(:get).with("1").and_return(mock_venue(mock_arguments(:destroy => true)))
      delete :destroy, :id => "1"
      response.should redirect_to(venues_url)
    end

  end

end
