require 'spec_helper'

describe "/listings/new.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listing] = stub_model(Listing,
      :new_record? => true,
      :location => "value for location",
      :email => "value for email",
      :name => "value for name",
      :driver => false,
      :password => "value for password"
    )
  end

  it "renders new listing form" do
    render

    response.should have_tag("form[action=?][method=post]", listings_path) do
      with_tag("input#listing_location[name=?]", "listing[location]")
      with_tag("input#listing_email[name=?]", "listing[email]")
      with_tag("input#listing_name[name=?]", "listing[name]")
      with_tag("input#listing_driver[name=?]", "listing[driver]")
      with_tag("input#listing_password[name=?]", "listing[password]")
    end
  end
end
