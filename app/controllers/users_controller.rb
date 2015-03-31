class UsersController < ApplicationController
  def index
    @users = User.all
    @questions = Question.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
