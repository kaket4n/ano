class TradableSkill < ApplicationRecord
  acts_as_paranoid

  belongs_to :skill
  belongs_to :user

  validates :user_id, uniqueness: { scope: :skill_id }
  validate :cannot_be_set_more_than_three_skills_per_user

  before_validation do
    self.user_id = skill.user_id if user_id.blank?
  end

  private

  def cannot_be_set_more_than_three_skills_per_user
    # NOTE: save 前にスキルの数が3つ以上であった場合には弾く
    if user.tradable_skills.count >= 3
      errors.add(:base, :cannot_be_set_more_than_three_skills_per_user)
    end
  end
end
