# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users
  validates :name, presence: true
end
