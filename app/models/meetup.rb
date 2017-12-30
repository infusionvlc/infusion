class Meetup < ApplicationRecord
  has_many :holdings
  has_many :users, through: :holdings, as: :hosts

  has_and_belongs_to_many :categories

  has_many :attachments, dependent: :destroy
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :attachments,
                                reject_if: proc { |attributes|
                                  attributes[:file].blank?
                                },
                                allow_destroy: true

  accepts_nested_attributes_for :photos,
                                reject_if: proc { |attributes|
                                  attributes[:file].blank?
                                },
                                allow_destroy: true

  has_many :assistances
  has_many :users, through: :assistances, as: :assistants

  validates :title, presence: true
  validates :description, presence: true
  validates :requirements, presence: true

  def taking_place?
    !date.nil?
  end
end
