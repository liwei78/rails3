require 'spec_helper'

describe User do
  describe "user validate" do
    it "create with a blank email" do
      user = User.create(:email => "")
      user.should_not be_valid
      assert_msg(user, "Email is invalid")
      assert_msg(user, "Email can't be blank")
    end

    it "create with a invalid email format" do
      user = User.create(:email => "aaa")
      user.should_not be_valid
      user.errors.full_messages.should include("Email is invalid")
    end

    it "create with a unique email" do
      User.create(:email => "q@123.com", :password => "1234")
      user = User.create(:email => "q@123.com", :password => "1234" )
      user.should_not be_valid
      user.errors.full_messages.should include("Email has already been taken")
    end
    
    it "name should not too long and too short" do
      too_short = User.create(:email => "a@123.com", :name => "a"*2)
      too_short.should_not be_valid
      too_short.errors.full_messages.should include("Name is too short (minimum is 3 characters)")
      
      too_long = User.create(:email => "b@123.com", :name => "b"*17)
      too_long.should_not be_valid
      assert_msg(too_long, "Name is too long (maximum is 16 characters)")
      
      short_right_name = User.create(:email => "c@123.com", :name => "c"*3 , :password => "1234")
      short_right_name.should be_valid
      
      long_right_name = User.create(:email => "d@123.com", :name => "d"*16, :password => "1234")
      long_right_name.should be_valid
    end
  end
  
  describe "login with email and password" do
    before(:each) do
      User.create(
        :email => "liwei@123.com",
        :name => "liwei", 
        :password => "liwei", 
        :password_confirmation => "liwei" 
      )
    end
    
    it "login with email and password" do
      login_user = User.authenticate("liwei@123.com", "liwei")
      login_user.should_not be_nil
      login_user.name.should == "liwei"
    end

  end
  
  
  private
  
  def assert_msg(klass, msg)
    klass.errors.full_messages.should include(msg)
  end
end
