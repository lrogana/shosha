class Tournament < ApplicationRecord
  belongs_to :user
  has_many :teams
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :address, presence: true
  default_scope -> {order(created_at: :desc)}
end
