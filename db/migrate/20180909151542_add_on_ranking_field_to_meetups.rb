class AddOnRankingFieldToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :on_ranking, :boolean

    Meetup.find_each do |meetup|
      meetup.on_ranking = (meetup.sessions.count == 0)
    end
  end
end
