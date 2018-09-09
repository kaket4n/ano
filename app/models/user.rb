class User < ApplicationRecord
  authenticates_with_sorcery!
  acts_as_paranoid

  has_many :skills
  has_many :requesting_orders, class_name: 'Order' # requesting
  has_many :requesting_skills, through: :requesting_orders, source: :skill # requesting
  has_many :requested_orders, class_name: 'Order', through: :skills, source: :orders
  has_many :requested_skills, through: :requested_orders, source: :skill

  validates :screen_name, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
