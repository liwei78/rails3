class PadsController < ApplicationController
  
  before_filter :login_required, :only => [:new, :create, :update]
  
  # GET /pads
  # GET /pads.xml
  def index
    @pads = Pad.paginate(
      :select   => "users.name as username, pads.*",
      :joins    => "left join users on users.id = pads.user_id", 
      :page     => params[:page], 
      :per_page => 20, 
      :order    => "pads.id desc")
    @page_title = "All Pads"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pads }
    end
  end

  # GET /pads/1
  # GET /pads/1.xml
  def show
    @pad = Pad.find(params[:id])
    @contents = @pad.contents
    @tags = Tag.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pad }
    end
  end

  # GET /pads/new
  # GET /pads/new.xml
  def new
    @pad = Pad.new
    @tags = Tag.all
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /pads/1/edit
  def edit
    @pad = Pad.find(params[:id])
  end

  # POST /pads
  # POST /pads.xml
  def create
    @pad = Pad.new(params[:pad])
    @pad.user_id = session[:user_id]
    respond_to do |format|
      if @pad.save
        Content.create([
          {:pad_id => @pad.id, :body => params[:text_body], :used_for => "text", :position => 1, :user_id => session[:user_id], :content_type => params[:content_type]},
          {:pad_id => @pad.id, :body => params[:code_body], :used_for => "code", :position => 2, :user_id => session[:user_id], :code_language => params[:code_language]}
        ])
        flash[:notice] = "welcome to EZPad, continue edit, and injoy it !!!"
      else
        @msg = @pad.errors.full_messages.join(',')
      end
      format.js
    end
  end

  # PUT /pads/1
  # PUT /pads/1.xml
  def update
    @pad = Pad.find(params[:id])

    respond_to do |format|
      if @pad.update_attributes(params[:pad])
        format.html { redirect_to(@pad, :notice => 'Pad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pads/1
  # DELETE /pads/1.xml
  def destroy
    @pad = Pad.find(params[:id])
    @pad.destroy

    respond_to do |format|
      format.html { redirect_to(pads_url) }
      format.xml  { head :ok }
    end
  end
  
  def append
    @content = Content.new(:position => 33)
    respond_to do |format|
      format.js
    end
  end
end
