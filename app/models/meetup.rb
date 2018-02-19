class Meetup < ApplicationRecord
  include Feed

  has_one :activity, as: :objective, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  has_many :holdings, dependent: :destroy
  has_many :hosts, through: :holdings, source: :user

  belongs_to :location

  has_and_belongs_to_many :categories

  has_many :attachments, dependent: :destroy
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :holdings, allow_destroy: true
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :assistances, dependent: :destroy
  has_many :assistants, through: :assistances, source: :user

  validates :title, presence: true
  validates :description, presence: true
  validates :requirements, presence: true
  validates :location, presence: true

  def taking_place?
    !date.nil? && date >= Date.today
  end

  def took_place?
    !date.nil? && date < Date.today
  end

  def average_rating
    marks = assistances.where.not(mark: 0).pluck(:mark)
    if marks.count > 0
      marks.sum / marks.count
    else
      0
    end
  end
end
