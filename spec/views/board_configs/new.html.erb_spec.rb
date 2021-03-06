require 'spec_helper'

describe "/board_configs/new.html.erb" do
  include BoardConfigsHelper

  before(:each) do
    assigns[:board_config] = stub_model(BoardConfig,
      :new_record? => true,
      :board_id => 1,
      :locale_id => 1,
      :map_url => "value for map_url",
      :directions_url => "value for directions_url"
    )
  end

  it "renders new board_config form" do
    render

    response.should have_tag("form[action=?][method=post]", board_configs_path) do
      with_tag("input#board_config_board_id[name=?]", "board_config[board_id]")
      with_tag("input#board_config_locale_id[name=?]", "board_config[locale_id]")
      with_tag("input#board_config_map_url[name=?]", "board_config[map_url]")
      with_tag("input#board_config_directions_url[name=?]", "board_config[directions_url]")
    end
  end
end
