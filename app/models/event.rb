# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :sessions
  has_many :meetups, through: :sessions

  validates :date, uniqueness: true

  validate :date_is_in_the_future, :on => :create

  private

  def date_is_in_the_future
    date >= Date.today
  end
end
