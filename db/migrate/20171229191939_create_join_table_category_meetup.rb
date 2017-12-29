class CreateJoinTableCategoryMeetup < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :meetups do |t|
      # t.index [:category_id, :meetup_id]
      # t.index [:meetup_id, :category_id]
    end
  end
end
