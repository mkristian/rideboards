require 'spec_helper'

describe "/board_configs/show.html.erb" do
  include BoardConfigsHelper
  before(:each) do
    assigns[:board_config] = @board_config = stub_model(BoardConfig,
      :board_id => 1,
      :locale_id => 1,
      :map_url => "value for map_url",
      :directions_url => "value for directions_url"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ map_url/)
    response.should have_text(/value\ for\ directions_url/)
  end
end
