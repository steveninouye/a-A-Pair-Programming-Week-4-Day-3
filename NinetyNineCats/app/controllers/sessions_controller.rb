class SessionsController < ApplicationController
  before_action :user_signed_in?, only: [:new]
  
  def new  # Log In form
    render :new
  end
  
  def create # Log In
  
    user = User.find_by_credentials(
      params[:user][:user_name], 
      params[:user][:password])
    
    if user
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to cats_url
    else
      redirect_to new_session_url
    end
  end
  
  def destroy # Log Out
    if current_user
      session[:session_token] = nil
      @current_user.reset_session_token!
    end
    redirect_to cats_url
  end
  
  def user_signed_in?
    if current_user
      redirect_to cats_url
    end
  end
end