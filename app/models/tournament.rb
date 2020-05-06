class Tournament < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
end
