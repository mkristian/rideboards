require 'spec_helper'

describe "/boards/new.html.erb" do
  include BoardsHelper

  before(:each) do
    assigns[:board] = stub_model(Board,
      :new_record? => true,
      :name => "value for name",
      :fullname => "value for fullname",
      :position => 1,
      :enabled => false
    )
  end

  it "renders new board form" do
    render

    response.should have_tag("form[action=?][method=post]", boards_path) do
      with_tag("input#board_name[name=?]", "board[name]")
      with_tag("input#board_fullname[name=?]", "board[fullname]")
      with_tag("input#board_position[name=?]", "board[position]")
      with_tag("input#board_enabled[name=?]", "board[enabled]")
    end
  end
end
