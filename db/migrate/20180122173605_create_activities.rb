class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :objetive_id
      t.string :objetive_type

      t.timestamps
    end
  end
end
