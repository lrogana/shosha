class Tournament < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :games
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :address, presence: true
  validates :sport, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  default_scope -> {order(created_at: :desc)}
end
