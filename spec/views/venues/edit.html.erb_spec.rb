require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/edit.html.erb" do
  include VenuesHelper

  before(:each) do
    assigns[:venue] = @venue = stub_model(Venue,
      :new_record? => false,
      :fullname => "value for fullname",
      :email => "value for email",
      :password => "value for password",
      :bcc => false,
      :enabled => false
    )
  end

  it "renders the edit venue form" do
    render

    response.should have_tag("form[action=#{venue_path(@venue.key)}][method=post]") do
      with_tag('input#venue_fullname[name=?]', "venue[fullname]")
      with_tag('input#venue_email[name=?]', "venue[email]")
      with_tag('input#venue_password[name=?]', "venue[password]")
      with_tag('input#venue_bcc[name=?]', "venue[bcc]")
      with_tag('input#venue_enabled[name=?]', "venue[enabled]")
    end
  end
end
