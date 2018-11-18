# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :objective, polymorphic: true
  has_many :notifications, dependent: :destroy

  # Returns the activity's target object title
  def activity_title
    if objective_type == 'Meetup'
      Meetup.find(objective_id).title
    elsif objective_type == 'Assistance'
      Assistance.find(objective_id).review
    else
      Proposal.find(objective_id).title
    end
  end

  # Sends a mail to all target users related to an activity
  def create_notification
    User.all.each do |user|
      NotificationMailer.notify_proposal(self, user).deliver
      Notification.create(user_id: user.id,
                          activity_id: self.id)
    end
  end
end
