class Users::SkillsController < ApplicationController
  def index
    @user = user
    @skills = user.skills
  end

  def show
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
    render :eidt unless skill.update(skill_params)

    redirect_to user_skill_path(skill)
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
end
