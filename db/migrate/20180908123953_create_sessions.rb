# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.references :event, foreign_key: true
      t.references :location, foreign_key: true
      t.references :meetup, foreign_key: true
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
