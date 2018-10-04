# frozen_string_literal: true

class RemoveFieldsFromMeetups < ActiveRecord::Migration[5.1]
  def change
    Meetup.find_each do |meetup|
      event = Event.create(date: meetup.date)
      meetup.sessions.create(
      start: meetup.start,
      end: meetup.end,
      event_id: event.id,
      location_id: meetup.location_id
      )
    end
    remove_column :meetups, :date, :date
    remove_column :meetups, :start, :time
    remove_column :meetups, :end, :time
    remove_column :meetups, :location_id, :integer
  end
end
