class UsersController < ApplicationController
before_action :check_auth?, only: [:index]

def index

end
def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.save
  redirect_to login_path
end

private
def user_params
  params.require(:user).permit(:name, :email, :password)
end

def check_auth?
  session[:login] == "authenticated"
end

end
