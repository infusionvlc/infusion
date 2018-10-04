# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :proposal
  validates :user_id, presence: true
end
