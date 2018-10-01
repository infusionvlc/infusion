# frozen_string_literal: true

class AddSettingsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :notify_meetups, :boolean, default: true
    add_column :users, :notify_comments, :boolean, default: false
    add_column :users, :notify_proposals, :boolean, default: false
  end
end
