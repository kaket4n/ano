class Users::SkillsController < ApplicationController
  def index
    @skills = user.skills
  end

  def new
    @skill = current_user.skills.new
  end

  def create
    @skill = current_user.skills.new(skill_params)

    unless @skill.save
      render :new and return
    end

    redirect_to user_skills_path(current_user)
  end

  def destroy
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
  helper_method :user

  def skill_params
    params.require(:skill).permit(
      :name,
      :description,
    )
  end
end
