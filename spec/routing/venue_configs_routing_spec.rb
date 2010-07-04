require 'spec_helper'

describe VenueConfigsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/venue_configs" }.should route_to(:controller => "venue_configs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/venue_configs/new" }.should route_to(:controller => "venue_configs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/venue_configs/1" }.should route_to(:controller => "venue_configs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/venue_configs/1/edit" }.should route_to(:controller => "venue_configs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/venue_configs" }.should route_to(:controller => "venue_configs", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/venue_configs/1" }.should route_to(:controller => "venue_configs", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/venue_configs/1" }.should route_to(:controller => "venue_configs", :action => "destroy", :id => "1") 
    end
  end
end
