class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:new]
  
  def new
    @user = User.new
    render :new
  end

  def show
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
  end
  
  def create
    user = User.new(user_name: params[:user][:user_name])
    user.password=(params[:user][:password])
    user.reset_session_token!
    session[:session_token] = user.session_token
    user.save!
    redirect_to cats_url
  end

  def user_signed_in?
    if current_user
      redirect_to cats_url
    end
  end
end