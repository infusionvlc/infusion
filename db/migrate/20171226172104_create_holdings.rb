# frozen_string_literal: true

class CreateHoldings < ActiveRecord::Migration[5.1]
  def change
    create_table :holdings do |t|
      t.references :user, foreign_key: true
      t.integer :role, default: 0
      t.references :meetup, foreign_key: true

      t.timestamps
    end
  end
end
