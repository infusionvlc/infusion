# frozen_string_literal: true

class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # Remove all notifications from a user's panel
  def mark_all_as_read
    current_user.notifications.update_all(read: true)
    puts current_user.username
    respond_to do |format|
      format.js   { render 'notifications/read'}
    end
  end

end
