require 'spec_helper'

describe "/venues/index.html.erb" do
  include VenuesHelper

  before(:each) do
    assigns[:venues] = [
      stub_model(Venue,
        :fullname => "value for fullname",
        :email => "value for email",
        :password => "value for password",
        :bcc => false,
        :enabled => false
      ),
      stub_model(Venue,
        :fullname => "value for fullname",
        :email => "value for email",
        :password => "value for password",
        :bcc => false,
        :enabled => false
      )
    ]
  end

  it "renders a list of venues" do
    render
    response.should have_tag("tr>td", "value for fullname".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
