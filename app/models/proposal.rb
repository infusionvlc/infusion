class Proposal < ApplicationRecord
  belongs_to :user
  has_many :reports, as: :reportable
  has_one :activities, as: :objective
  has_many :votes, dependent: :destroy
  has_many :fans, through: :votes, source: :user
end
