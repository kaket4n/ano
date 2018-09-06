class Skill < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_one :tradable, class_name: 'TradableSkill'
  validates :name, presence: true
end
