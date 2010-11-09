require "spec_helper"

describe ContentsController do
  describe "routing" do

    it "recognizes and generates #create" do
      { :post => "/contents" }.should route_to(:controller => "contents", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/contents/1" }.should route_to(:controller => "contents", :action => "update", :id => "1")
    end

  end
end
