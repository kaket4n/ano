class UsersController < ApplicationController
  def show
    @user = user

    @requesting_orders = user.requesting_orders.includes(:skill)
    @requested_orders = user.requested_orders.includes(:skill)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :screen_name,
      :email,
      :password,
      :password_confirmation,
    )
  end
end
