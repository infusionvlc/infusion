class RenameMeetupIdInAssistances < ActiveRecord::Migration[5.1]
  def change
    rename_column :assistances, :meetup_id, :session_id
  end
end
