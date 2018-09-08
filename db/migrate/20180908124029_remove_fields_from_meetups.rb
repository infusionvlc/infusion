class RemoveFieldsFromMeetups < ActiveRecord::Migration[5.1]
  def change
    Meetup.find_each do |meetup|
      event = Event.create(date: meetup.date)
      meetup.sessions.create(
      start: meetup.start,
      end: meetup.end,
      video_url: meetup.video_url,
      event_id: event.id
      )
    end
    remove_column :meetups, :date, :date
    remove_column :meetups, :start, :time
    remove_column :meetups, :end, :time
    remove_column :meetups, :video_url, :string
  end
end
