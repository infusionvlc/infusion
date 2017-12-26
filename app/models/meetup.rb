class Meetup < ApplicationRecord
    has_many :holdings
    has_many :users, through: :holdings, as: :hosts

    has_and_belongs_to_many :categories

    has_many :assistances
    has_many :users, through: :assistances, as: :assistants
end
