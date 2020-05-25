class Team < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
  validates :tournament_id, presence: true
  validates :name, presence:true
  validates :team_contact_name, presence: true
  validates :team_contact_phone_number, presence: true
  default_scope -> { order(created_at: :desc) }
end
