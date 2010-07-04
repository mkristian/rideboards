require 'spec_helper'

describe "/boards/index.html.erb" do
  include BoardsHelper

  before(:each) do
    assigns[:boards] = [
      stub_model(Board,
        :name => "value for name",
        :fullname => "value for fullname",
        :position => 1,
        :enabled => false
      ),
      stub_model(Board,
        :name => "value for name",
        :fullname => "value for fullname",
        :position => 1,
        :enabled => false
      )
    ]
  end

  it "renders a list of boards" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for fullname".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
