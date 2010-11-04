class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        format.html {redirect_to @user}
      else
        format.html {render :action => "new"}
      end
    end
  end

end
