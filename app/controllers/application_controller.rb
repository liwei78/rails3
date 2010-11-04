class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_required
    redirect_to new_session_path if session[:user_id].nil?
  end
end
