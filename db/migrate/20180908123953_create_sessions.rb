class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.event_id :integer
      t.time :start
      t.time :end
      t.string :video_url

      t.timestamps
    end
  end
end
