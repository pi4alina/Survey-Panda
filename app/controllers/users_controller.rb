class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @username = @user.username
    @surveys = @user.surveys
    @taken_surveys = @user.takensurveys
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
