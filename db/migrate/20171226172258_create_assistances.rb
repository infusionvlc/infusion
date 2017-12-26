class CreateAssistances < ActiveRecord::Migration[5.1]
  def change
    create_table :assistances do |t|
      t.references :user, foreign_key: true
      t.references :meetup, foreign_key: true
      t.integer :mark, default: 0
      t.text :review

      t.timestamps
    end
  end
end
