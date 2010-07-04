require 'spec_helper'

describe "/listings/index.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listings] = [
      stub_model(Listing,
        :location => "value for location",
        :email => "value for email",
        :name => "value for name",
        :driver => false,
        :password => "value for password"
      ),
      stub_model(Listing,
        :location => "value for location",
        :email => "value for email",
        :name => "value for name",
        :driver => false,
        :password => "value for password"
      )
    ]
  end

  it "renders a list of listings" do
    render
    response.should have_tag("tr>td", "value for location".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
  end
end
