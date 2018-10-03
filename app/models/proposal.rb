# frozen_string_literal: true

class Proposal < ApplicationRecord
  include Feed
  belongs_to :user
  has_one :activity, as: :objective, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :fans, through: :votes, source: :user
  validates :title, :description, :user_id, presence: true
end
