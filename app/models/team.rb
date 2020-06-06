class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
  has_many :games
  validates :tournament_id, presence: true
  validates :name,  presence: true, length: { maximum: 50 }
  validates :team_contact_name, presence: true, length: { maximum: 50 }
  validates :team_contact_phone_number, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }
  default_scope -> { order(created_at: :desc) }
end
