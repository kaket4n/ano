class User < ApplicationRecord
  authenticates_with_sorcery!
  acts_as_paranoid

  has_many :skills
  # STUDY: マスターデータから一部選択するためのテーブル作成のベストプラクティス
  has_many :relation_tradable_skills, class_name: 'TradableSkill'
  has_many :tradable_skills, through: :relation_tradable_skills, source: :skill

  validates :screen_name, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
