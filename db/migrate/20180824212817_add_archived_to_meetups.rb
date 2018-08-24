class AddArchivedToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :archived, :boolean, default: :false
  end
end
