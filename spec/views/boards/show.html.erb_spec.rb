require 'spec_helper'

describe "/boards/show.html.erb" do
  include BoardsHelper
  before(:each) do
    assigns[:board] = @board = stub_model(Board,
      :name => "value for name",
      :fullname => "value for fullname",
      :position => 1,
      :enabled => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ fullname/)
    response.should have_text(/1/)
    response.should have_text(/false/)
  end
end
