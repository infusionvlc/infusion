class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :objective, polymorphic: true
  has_many :notifications, dependent: :destroy
  def activity_title
    if objective_type == 'Meetup'
      Meetup.find(objective_id).title
    elsif objective_type == 'Assistance'
      Assistance.find(objective_id).review
    else
      Proposal.find(objective_id).title
    end
  end
end
