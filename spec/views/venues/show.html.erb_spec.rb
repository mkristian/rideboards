require 'spec_helper'

describe "/venues/show.html.erb" do
  include VenuesHelper
  before(:each) do
    assigns[:venue] = @venue = stub_model(Venue,
      :fullname => "value for fullname",
      :email => "value for email",
      :password => "value for password",
      :bcc => false,
      :enabled => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ fullname/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ password/)
    response.should have_text(/false/)
    response.should have_text(/false/)
  end
end
