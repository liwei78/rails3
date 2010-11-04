require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "login " do
    before(:each) do
      @user = Factory(:user)
      @attr = {:email => "liwei@123.com", :password => "liwei"}
    end
    
    it "login correct" do
      post :create, :user => @attr
      response.should redirect_to(user_path(@user))
      login_user = User.find(session[:user_id])
      login_user.should_not be_nil
      login_user.email.should == "liwei@123.com"
    end
    
    it "login incorrect" do
      post :create, :user => @attr.merge(:password => "123")
      response.should render_template(:new)
    end
  end

end
