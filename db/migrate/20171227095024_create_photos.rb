# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.references :meetup, foreign_key: true
      t.string :attribution
      t.timestamps
    end
  end
end
