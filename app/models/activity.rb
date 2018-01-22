class Activity < ApplicationRecord
    belongs_to :user
    belongs_to :activable, polymorphic: true
end
