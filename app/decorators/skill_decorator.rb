module SkillDecorator
  def edit_path
    if current_users?
      link_to "編集する", edit_user_skill_path(user.id, self.id)
    end
  end

  def delete_path
    if current_users?
      link_to "削除する", user_skill_path(user.id, self.id), method: :delete
    end
  end

  private

  def current_users?
    return if user.blank?
    user == current_user
  end
end
