class Assistance < ApplicationRecord
  has_many :reports, as: :reportable
  has_one :activities, as: :objective
  belongs_to :user
  belongs_to :meetup
end
