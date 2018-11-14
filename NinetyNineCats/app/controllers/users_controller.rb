class UsersController
  def new
    @user = User.new
    render :new
  end

  def show
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
  end
  
  def create
    User.new(user_name: params[:user][:user_name])
  end
  
  def destroy
    
  end
end