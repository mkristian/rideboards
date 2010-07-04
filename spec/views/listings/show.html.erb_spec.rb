require 'spec_helper'

describe "/listings/show.html.erb" do
  include ListingsHelper
  before(:each) do
    assigns[:listing] = @listing = stub_model(Listing,
      :location => "value for location",
      :email => "value for email",
      :name => "value for name",
      :driver => false,
      :password => "value for password"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ location/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ password/)
  end
end
