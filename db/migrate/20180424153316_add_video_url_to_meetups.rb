class AddVideoUrlToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :video_url, :string
  end
end
