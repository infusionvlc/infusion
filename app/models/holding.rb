class Holding < ApplicationRecord
  belongs_to :user
  belongs_to :meetup
  validates :meetup_id, :role, :user_id, presence: true
end
