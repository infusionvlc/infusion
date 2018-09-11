class RenameMeetupIdInAssistances < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :assistances, :meetups
    rename_column      :assistances, :meetup_id, :session_id
    add_foreign_key    :assistances, :sessions
  end
end
