class AddConfirmationMailToMeetup < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :confirmation_mail, :boolean
  end
end
