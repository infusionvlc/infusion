class CreateMeetups < ActiveRecord::Migration[5.1]
  def change
    create_table :meetups do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.date :date
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
