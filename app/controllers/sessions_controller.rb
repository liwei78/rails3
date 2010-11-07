class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        format.html {redirect_to @user, :notice => "login success!"}
      else
        flash[:error] = "login failed!"
        format.html {render :action => "new"}
      end
    end
  end
  
  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

end
