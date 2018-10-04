# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :sessions
  has_many :meetups, through: :sessions

  validates :date, uniqueness: true
end
