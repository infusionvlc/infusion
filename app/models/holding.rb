class Holding < ApplicationRecord
  belongs_to :user
  belongs_to :meetup

  validates :role, presence: true
end
