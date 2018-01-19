class Assistance < ApplicationRecord
  has_many :reports, as: :reportable
  belongs_to :user
  belongs_to :meetup
end
