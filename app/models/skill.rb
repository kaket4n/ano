class Skill < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :orders # requested

  validates :name, presence: true
end
