class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
  validates :tournament_id, presence: true
  validates :name,  presence: true, length: { maximum: 50 }
  validates :team_contact_name, presence: true, length: { maximum: 50 }
  validates :team_contact_phone_number, presence: true, length: { maximum: 20 }

  default_scope -> { order(created_at: :desc) }
end
