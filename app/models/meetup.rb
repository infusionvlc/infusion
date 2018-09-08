class Meetup < ApplicationRecord
  include Feed

  scope :active, -> { where(archived: false) }

  has_many :sessions

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

  validates :title, presence: true
  validates :description, presence: true
  validates :requirements, presence: true

  def taking_place?
    session_date = sessions.first&.date_id
    session_date && session_date >= Date.today
  end

  def took_place?
    session_date = sessions.first&.date_id
    session_date && session_date < Date.today
  end

  def average_rating
    marks = sessions.pluck(:average_rating)
    if marks.count > 0
      marks.sum / marks.count
    else
      0
    end
  end
end
