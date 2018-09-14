class Session < ApplicationRecord
  belongs_to :location
  belongs_to :event, optional: true
  belongs_to :meetup

  has_many :assistances, dependent: :destroy
  has_many :assistants, through: :assistances, source: :user

  validates :location, presence: true

  def average_rating
    marks = assistances.where.not(mark: 0).pluck(:mark)
    if marks.count.positive?
      marks.sum / marks.count
    else
      0
    end
  end

  def taking_place?
    event && (event.date >= Date.today)
  end

  def took_place?
    event && (event.date <= Date.today)
  end
end
