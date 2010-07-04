require 'spec_helper'

describe "/venue_configs/index.html.erb" do
  include VenueConfigsHelper

  before(:each) do
    assigns[:venue_configs] = [
      stub_model(VenueConfig,
        :locale_id => 1,
        :venue_id => 1,
        :date_format => "value for date_format",
        :home_url => "value for home_url",
        :schedule_url => "value for schedule_url",
        :checklist_url => "value for checklist_url",
        :iframe_url => "value for iframe_url"
      ),
      stub_model(VenueConfig,
        :locale_id => 1,
        :venue_id => 1,
        :date_format => "value for date_format",
        :home_url => "value for home_url",
        :schedule_url => "value for schedule_url",
        :checklist_url => "value for checklist_url",
        :iframe_url => "value for iframe_url"
      )
    ]
  end

  it "renders a list of venue_configs" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for date_format".to_s, 2)
    response.should have_tag("tr>td", "value for home_url".to_s, 2)
    response.should have_tag("tr>td", "value for schedule_url".to_s, 2)
    response.should have_tag("tr>td", "value for checklist_url".to_s, 2)
    response.should have_tag("tr>td", "value for iframe_url".to_s, 2)
  end
end
