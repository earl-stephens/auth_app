class SessionsController < ApplicationController

def new
  session[:login] = "not authenticated"
  # @session = session[:login]
  # binding.pry
end

def create
  email = params[:email]
  password = params[:password]
  if User.authenticate(email, password)
    session[:login] = "authenticated"
    flash[:notice] = "You are logged in."
    redirect_to root_path
  else
    flash[:notice] = "You are not logged in."
    render :new
  end
end

def destroy
  # binding.pry
  reset_session
  # binding.pry
  flash[:notice] = "You are now logged out."
  redirect_to root_path
end

end
