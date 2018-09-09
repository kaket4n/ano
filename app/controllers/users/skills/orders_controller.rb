class Users::Skills::OrdersController < ApplicationController
  def create
    unless skill.orders.create(user_id: current_user.id)
      flash[:error] = "注文できませんでした"
    end

    redirect_to user_skills_path(user)
  end

  def destroy
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def skill
    @skill ||= Skill.find(params[:skill_id])
  end
end
