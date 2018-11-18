# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :location
  belongs_to :event, optional: true
  belongs_to :meetup

  has_many :assistances, dependent: :destroy
  has_many :assistants, through: :assistances, source: :user

  validates :location, presence: true

  # Returns the average rating from all assistants
  def average_rating
    marks = assistances.where.not(mark: 0).pluck(:mark)
    if marks.count.positive?
      marks.sum / marks.count
    else
      0
    end
  end

  # Checks if the session's date is in the future
  def taking_place?
    event && (event.date >= Date.today)
  end

  # Checks if the session's date is in the past
  def took_place?
    event && (event.date <= Date.today)
  end
end
