require 'spec_helper'

describe "/board_configs/index.html.erb" do
  include BoardConfigsHelper

  before(:each) do
    assigns[:board_configs] = [
      stub_model(BoardConfig,
        :board_id => 1,
        :locale_id => 1,
        :map_url => "value for map_url",
        :directions_url => "value for directions_url"
      ),
      stub_model(BoardConfig,
        :board_id => 1,
        :locale_id => 1,
        :map_url => "value for map_url",
        :directions_url => "value for directions_url"
      )
    ]
  end

  it "renders a list of board_configs" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for map_url".to_s, 2)
    response.should have_tag("tr>td", "value for directions_url".to_s, 2)
  end
end
