require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venue_configs/edit.html.erb" do
  include VenueConfigsHelper

  before(:each) do
    assigns[:venue_config] = @venue_config = stub_model(VenueConfig,
      :new_record? => false,
      :locale_id => 1,
      :venue_id => 1,
      :date_format => "value for date_format",
      :home_url => "value for home_url",
      :schedule_url => "value for schedule_url",
      :checklist_url => "value for checklist_url",
      :iframe_url => "value for iframe_url"
    )
  end

  it "renders the edit venue_config form" do
    render

    response.should have_tag("form[action=#{venue_config_path(@venue_config.key)}][method=post]") do
      with_tag('input#venue_config_locale_id[name=?]', "venue_config[locale_id]")
      with_tag('input#venue_config_venue_id[name=?]', "venue_config[venue_id]")
      with_tag('input#venue_config_date_format[name=?]', "venue_config[date_format]")
      with_tag('input#venue_config_home_url[name=?]', "venue_config[home_url]")
      with_tag('input#venue_config_schedule_url[name=?]', "venue_config[schedule_url]")
      with_tag('input#venue_config_checklist_url[name=?]', "venue_config[checklist_url]")
      with_tag('input#venue_config_iframe_url[name=?]', "venue_config[iframe_url]")
    end
  end
end
