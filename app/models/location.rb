# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :sessions
  validates :name, presence: true
end
