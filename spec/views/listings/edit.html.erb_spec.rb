require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/listings/edit.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listing] = @listing = stub_model(Listing,
      :new_record? => false,
      :location => "value for location",
      :email => "value for email",
      :name => "value for name",
      :driver => false,
      :password => "value for password"
    )
  end

  it "renders the edit listing form" do
    render

    response.should have_tag("form[action=#{listing_path(@listing.key)}][method=post]") do
      with_tag('input#listing_location[name=?]', "listing[location]")
      with_tag('input#listing_email[name=?]', "listing[email]")
      with_tag('input#listing_name[name=?]', "listing[name]")
      with_tag('input#listing_driver[name=?]', "listing[driver]")
      with_tag('input#listing_password[name=?]', "listing[password]")
    end
  end
end
