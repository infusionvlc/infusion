# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :objective_id
      t.string :objective_type

      t.timestamps
    end
  end
end
