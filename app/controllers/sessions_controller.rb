class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:id] = user.id
      flash[:notice] = "Welcome back, #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Incorrect login"
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = "You've logged out"
    redirect_to root_path
  end
end
