class Assistance < ApplicationRecord
  has_many :reports, as: :reportable
  has_one :activities, as: :activable
  belongs_to :user
  belongs_to :meetup
end
