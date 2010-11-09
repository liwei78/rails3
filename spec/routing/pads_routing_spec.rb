require "spec_helper"

describe PadsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pads" }.should route_to(:controller => "pads", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pads/new" }.should route_to(:controller => "pads", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pads/1" }.should route_to(:controller => "pads", :action => "show", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pads" }.should route_to(:controller => "pads", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pads/1" }.should route_to(:controller => "pads", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pads/1" }.should route_to(:controller => "pads", :action => "destroy", :id => "1")
    end

  end
end
