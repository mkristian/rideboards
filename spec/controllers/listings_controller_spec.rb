require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
CONFIGURATION = Object.full_const_get(Ixtlan::Models::CONFIGURATION) unless Object.const_defined? "CONFIGURATION"
describe ListingsController do

  def mock_listing(stubs={})
    @mock_listing ||= mock_model(Listing, stubs)
  end

  def mock_array(*args)
    a = args
    def a.model
      Listing
    end
    a
  end

  def mock_arguments(merge = {})
    args = merge
    args.merge!(:current_user= => nil, :errors => {})
    args.merge!(:model => Listing, :key => 12)
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

    it "exposes all listings as @listings" do
      Listing.should_receive(:all).and_return(mock_array(mock_listing))
      get :index
      assigns[:listings].should == mock_array(mock_listing)
    end

    describe "with mime type of xml" do

      it "renders all listingses as xml" do
        Listing.should_receive(:all).and_return(listings = mock_array("Array of Listings"))
        listings.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested listing as @listing" do
      Listing.should_receive(:get!).with("37").and_return(mock_listing(mock_arguments))
      get :show, :id => "37"
      assigns[:listing].should equal(mock_listing)
    end

    describe "with mime type of xml" do

      it "renders the requested listing as xml" do
        Listing.should_receive(:get!).with("37").and_return(mock_listing(mock_arguments))
        mock_listing.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new listing as @listing" do
      Listing.should_receive(:new).and_return(mock_listing(mock_arguments))
      get :new
      assigns[:listing].should equal(mock_listing)
    end

  end

  describe "GET edit" do

    it "exposes the requested listing as @listing" do
      Listing.should_receive(:get!).with("37").and_return(mock_listing(mock_arguments))
      get :edit, :id => "37"
      assigns[:listing].should equal(mock_listing)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created listing as @listing" do
        Listing.should_receive(:new).with({'these' => 'params'}).and_return(mock_listing(mock_arguments(:save => true)))
        post :create, :listing => {:these => 'params'}
        assigns(:listing).should equal(mock_listing)
      end

      it "redirects to the created listing" do
        Listing.stub!(:new).and_return(mock_listing(mock_arguments(:save => true)))
        post :create, :listing => {}
        response.should redirect_to(listing_url(mock_listing))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved listing as @listing" do
        Listing.stub!(:new).with({'these' => 'params'}).and_return(mock_listing(mock_arguments(:save => false)))
        post :create, :listing => {:these => 'params'}
        assigns(:listing).should equal(mock_listing)
      end

      it "re-renders the 'new' template" do
        Listing.stub!(:new).and_return(mock_listing(mock_arguments(:save => false)))
        post :create, :listing => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested listing" do
        Listing.should_receive(:get!).with("37").and_return(mock_listing(mock_arguments))
        mock_listing.should_receive(:update).with({'these' => 'params'})
        mock_listing.should_receive(:dirty?)
        put :update, :id => "37", :listing => {:these => 'params'}
      end

      it "exposes the requested listing as @listing" do
        Listing.stub!(:get!).and_return(mock_listing(mock_arguments(:update => true)))
        put :update, :id => "1"
        assigns(:listing).should equal(mock_listing)
      end

      it "redirects to the listing" do
        Listing.stub!(:get!).and_return(mock_listing(mock_arguments(:update => true)))
        put :update, :id => "1"
        response.should redirect_to(listing_url(mock_listing))
      end

    end

    describe "with invalid params" do

      it "updates the requested listing" do
        Listing.should_receive(:get!).with("37").and_return(mock_listing(mock_arguments))
        mock_listing.should_receive(:update).with({'these' => 'params'})
        mock_listing.should_receive(:dirty?)
        put :update, :id => "37", :listing => {:these => 'params'}
      end

      it "exposes the listing as @listing" do
        Listing.stub!(:get!).and_return(mock_listing(mock_arguments(:update => false)))
        mock_listing.should_receive(:dirty?)
        put :update, :id => "1"
        assigns(:listing).should equal(mock_listing)
      end

      it "re-renders the 'edit' template" do
        Listing.stub!(:get!).and_return(mock_listing(mock_arguments(:update => false, :dirty? => true)))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested listing" do
      Listing.should_receive(:get).with("37").and_return(mock_listing(mock_arguments))
      mock_listing.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the listings list" do
      Listing.should_receive(:get).with("1").and_return(mock_listing(mock_arguments(:destroy => true)))
      delete :destroy, :id => "1"
      response.should redirect_to(listings_url)
    end

  end

end
