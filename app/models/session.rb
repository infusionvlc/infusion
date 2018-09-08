class Session < ApplicationRecord
  belongs_to :location
  belongs_to :event
  belongs_to :meetup

  has_many :assistances, dependent: :destroy
  has_many :assistants, through: :assistances, source: :user

  validates :location, presence: true

  def average_rating
    marks = assistances.where.not(mark: 0).pluck(:mark)
    if marks.count > 0
      marks.sum / marks.count
    else
      0
    end
  end
end
