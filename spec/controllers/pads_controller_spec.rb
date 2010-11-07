require 'spec_helper'

describe PadsController do

  def mock_pad(stubs={})
    (@mock_pad ||= mock_model(Pad).as_null_object).tap do |pad|
      pad.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all pads as @pads" do
      get :index
      assigns(:pads).should be_instance_of(Array)
    end
  end

  describe "GET show" do
    it "assigns the requested pad as @pad" do
      Pad.stub(:find).with("37") { mock_pad }
      get :show, :id => "37"
      assigns(:pad).should be(mock_pad)
    end
  end

  describe "GET new" do
    before(:each) do
      @user = Factory(:user)
      session[:user_id] = @user.id
    end
    it "assigns a new pad as @pad" do
      Pad.stub(:new) { mock_pad }
      get :new
      assigns(:pad).should be(mock_pad)
    end
  end

  describe "GET edit" do
    before(:each) do
      @user = Factory(:user)
      session[:user_id] = @user.id
    end
    it "assigns the requested pad as @pad" do
      Pad.stub(:find).with("37") { mock_pad }
      get :edit, :id => "37"
      assigns(:pad).should be(mock_pad)
    end
  end

  describe "POST create" do
    before(:each) do
      @user = Factory(:user)
      session[:user_id] = @user.id
    end

    describe "with valid params" do
      it "assigns a newly created pad as @pad" do
        Pad.stub(:new).with({'these' => 'params'}) { mock_pad(:save => true) }
        post :create, :pad => {'these' => 'params'}
        assigns(:pad).should be(mock_pad)
      end

      it "redirects to the created pad" do
        Pad.stub(:new) { mock_pad(:save => true) }
        post :create, :pad => {}
        response.should redirect_to(pad_url(mock_pad))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pad as @pad" do
        Pad.stub(:new).with({'these' => 'params'}) { mock_pad(:save => false) }
        post :create, :pad => {'these' => 'params'}
        assigns(:pad).should be(mock_pad)
      end

      it "re-renders the 'new' template" do
        Pad.stub(:new) { mock_pad(:save => false) }
        post :create, :pad => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do
    before(:each) do
      @user = Factory(:user)
      session[:user_id] = @user.id
    end

    describe "with valid params" do
      it "updates the requested pad" do
        Pad.should_receive(:find).with("37") { mock_pad }
        mock_pad.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pad => {'these' => 'params'}
      end

      it "assigns the requested pad as @pad" do
        Pad.stub(:find) { mock_pad(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pad).should be(mock_pad)
      end

      it "redirects to the pad" do
        Pad.stub(:find) { mock_pad(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pad_url(mock_pad))
      end
    end

    describe "with invalid params" do
      it "assigns the pad as @pad" do
        Pad.stub(:find) { mock_pad(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pad).should be(mock_pad)
      end

      it "re-renders the 'edit' template" do
        Pad.stub(:find) { mock_pad(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pad" do
      Pad.should_receive(:find).with("37") { mock_pad }
      mock_pad.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pads list" do
      Pad.stub(:find) { mock_pad }
      delete :destroy, :id => "1"
      response.should redirect_to(pads_url)
    end
  end
  
  describe "edit, update, new, create actions need login" do
    
    before(:each) do
      @pad = Pad.create(:title => "test")
    end
    
    it "edit" do
      get :edit, :id => @pad 
      response.should redirect_to(new_session_path)
    end
    
    it "update" do
      put :update, :id => @pad, :pad => {:title => "test"}
      response.should redirect_to(new_session_path)
    end
    
    it "new" do
      get :new
      response.should redirect_to(new_session_path)
    end
    
    it "create" do
      post :create, :pad => {:title => "other test"}
      response.should redirect_to(new_session_path)
    end
    
  end

end
