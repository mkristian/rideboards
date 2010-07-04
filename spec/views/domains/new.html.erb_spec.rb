require 'spec_helper'

describe "/domains/new.html.erb" do
  include DomainsHelper

  before(:each) do
    assigns[:domain] = stub_model(Domain,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new domain form" do
    render

    response.should have_tag("form[action=?][method=post]", domains_path) do
      with_tag("input#domain_name[name=?]", "domain[name]")
    end
  end
end
