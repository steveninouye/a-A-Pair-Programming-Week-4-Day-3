class SessionsController < ApplicationController
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
  
  def destroy
    
  end
end