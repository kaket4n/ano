class Order < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :skill

  validates :user_id, uniqueness: { scope: :skill_id }

  def skill_name
    skill.name
  end
end
