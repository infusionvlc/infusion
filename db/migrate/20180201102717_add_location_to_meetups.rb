class AddLocationToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :location_id, :integer
  end
end
