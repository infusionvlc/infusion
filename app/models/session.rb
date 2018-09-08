class Session < ApplicationRecord
  belongs_to :location
  belongs_to :event
  belongs_to :meetup

  has_many :assistances, dependent: :destroy
  has_many :assistants, through: :assistances, source: :user

  validates :location, presence: true
end
