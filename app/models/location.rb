class Location < ApplicationRecord
  has_many :meetups
  validates :name, presence: true
end
