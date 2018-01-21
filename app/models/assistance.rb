class Assistance < ApplicationRecord
  has_many :reports, as: :reportable, dependent: :destroy
  belongs_to :user
  belongs_to :meetup
end
