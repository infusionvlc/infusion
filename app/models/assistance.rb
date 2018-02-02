class Assistance < ApplicationRecord
  include Feed
  has_one :activities, as: :objective
  has_many :reports, as: :reportable, dependent: :destroy

  belongs_to :user
  belongs_to :meetup
  validates  :review, length: {minimum: 5}, if: :should_validate?
  validates  :mark, numericality: {greater_than: -1, less_than_or_equal_to: 5}, if: :should_validate?
  validates :user_id, :meetup_id, presence: true
  def should_validate?
    not new_record?
  end
end
