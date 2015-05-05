class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]
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

  def edit; end

  def update

    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated"
      redirect_to root_path
    else
      flash[:error] = "There was a problem, please try again"
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find_by(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
  end
end
