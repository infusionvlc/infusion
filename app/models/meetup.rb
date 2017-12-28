class Meetup < ApplicationRecord
    has_many :holdings
    has_many :users, through: :holdings, as: :hosts

    has_and_belongs_to_many :categories

    has_many :attachments
    has_many :photos

    has_many :assistances
    has_many :users, through: :assistances, as: :assistants

    validates :title, presence: true
    validates :description, presence: true
    validates :requirements, presence: true

    def is_taking_place?
        !date.nil?
    end
end
