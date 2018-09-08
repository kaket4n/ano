class Users::SkillsController < ApplicationController
  before_action :require_login, except: %i(index show)
  before_action :reject_invalid_user, except: %i(index show)

  def index
    @user = user
    @skills = user.skills
  end

  def show
    @user = user
    @skill = skill
  end

  def new
    @user = user
    @skill = current_user.skills.new
  end

  def create
    @skill = current_user.skills.new(skill_params)

    unless @skill.save
      render :new and return
    end

    redirect_to user_skills_path(current_user)
  end

  def edit
    @user = user
    @skill = skill
  end

  def update
    render :edit unless skill.update(skill_params)

    redirect_to user_skill_path(current_user)
  end

  def destroy
    flash[:error] = "削除に失敗しました" unless skill.destroy

    redirect_to user_skills_path(current_user)
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def skill
    @skill ||= Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(
      :name,
      :description,
    )
  end

  def reject_invalid_user
    redirect_to user_skills_path(current_user) unless user == current_user
  end
end
