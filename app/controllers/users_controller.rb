class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = UserInfo.all
  end

  def show
  end

  def create
    @user = UserInfo.new(user_params)
    if @user.save
      render json:@user
    else
      render_error(@user)
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render_error(@user)
  end

  def destroy
    @user.destroy
   render json: { message: 'removed' }, status: :ok
  end

  private
  def set_user
    @user = UserInfo.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
  
end
