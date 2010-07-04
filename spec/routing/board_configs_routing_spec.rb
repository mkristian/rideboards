require 'spec_helper'

describe BoardConfigsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/board_configs" }.should route_to(:controller => "board_configs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/board_configs/new" }.should route_to(:controller => "board_configs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/board_configs/1" }.should route_to(:controller => "board_configs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/board_configs/1/edit" }.should route_to(:controller => "board_configs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/board_configs" }.should route_to(:controller => "board_configs", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/board_configs/1" }.should route_to(:controller => "board_configs", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/board_configs/1" }.should route_to(:controller => "board_configs", :action => "destroy", :id => "1") 
    end
  end
end
