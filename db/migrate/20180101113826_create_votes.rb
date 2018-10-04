# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
