# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :activity_id
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
