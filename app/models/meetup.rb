# frozen_string_literal: true

class Meetup < ApplicationRecord
  include Feed

  scope :active, -> { where(archived: false) }

  has_many :sessions, dependent: :destroy
  has_many :events, through: :sessions

  has_one :activity, as: :objective, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  has_many :holdings, dependent: :destroy
  has_many :hosts, through: :holdings, source: :user

  has_and_belongs_to_many :categories

  has_many :attachments, dependent: :destroy
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :holdings, allow_destroy: true
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { minimum: 256 }
  validates :requirements, presence: true, length: { minimum: 10 }

  # Returns the meetup's last date
  def date
    sessions.joins(:event).all.last&.event&.date
  end

  # Returns the sum of meetup assistants
  def assistances
    sessions.map { |session| session.assistances }
            .reduce(:merge) || Assistance.none
  end

  # Checks if the meetup's date is in the future
  def taking_place?
    date = sessions.last&.event&.date
    date >= Date.today if date
  end

  # Checks if the meetup's date is in the past
  def took_place?
    date = sessions.last&.event&.date
    date <= Date.today if date
  end

  # Returns the average rating the meetup has got
  def average_rating
    marks = sessions.collect(&:average_rating)
    if marks.count.positive?
      marks.sum / marks.count
    else
      0
    end
  end
end
