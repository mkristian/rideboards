require 'spec_helper'

describe "/venue_configs/show.html.erb" do
  include VenueConfigsHelper
  before(:each) do
    assigns[:venue_config] = @venue_config = stub_model(VenueConfig,
      :locale_id => 1,
      :venue_id => 1,
      :date_format => "value for date_format",
      :home_url => "value for home_url",
      :schedule_url => "value for schedule_url",
      :checklist_url => "value for checklist_url",
      :iframe_url => "value for iframe_url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ date_format/)
    response.should have_text(/value\ for\ home_url/)
    response.should have_text(/value\ for\ schedule_url/)
    response.should have_text(/value\ for\ checklist_url/)
    response.should have_text(/value\ for\ iframe_url/)
  end
end
