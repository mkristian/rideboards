require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/boards/edit.html.erb" do
  include BoardsHelper

  before(:each) do
    assigns[:board] = @board = stub_model(Board,
      :new_record? => false,
      :name => "value for name",
      :fullname => "value for fullname",
      :position => 1,
      :enabled => false
    )
  end

  it "renders the edit board form" do
    render

    response.should have_tag("form[action=#{board_path(@board.key)}][method=post]") do
      with_tag('input#board_name[name=?]', "board[name]")
      with_tag('input#board_fullname[name=?]', "board[fullname]")
      with_tag('input#board_position[name=?]', "board[position]")
      with_tag('input#board_enabled[name=?]', "board[enabled]")
    end
  end
end
