class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Your profile has been saved"
      redirect_to root_path
    else
      flash[:error] = "There was a problem, please try again"
      render 'new'
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated"
      redirect_to root_path
    else
      flash[:error] = "There was a problem, please try again"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
