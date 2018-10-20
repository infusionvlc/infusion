# frozen_string_literal: true

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test 'a session is invalid without any event_id, location_id, meetup_id' do
    session = Session.new
    assert_not session.valid?
  end

  test 'valid session' do
    event = events(:one)
    location = locations(:one)
    meetup = meetups(:one)

    session = Session.new(event_id: event.id, location_id: location.id, meetup_id: meetup.id)
    assert session.valid?, true
  end

  test 'valid session has an average rating' do
    event = events(:one)
    location = locations(:one)
    meetup = meetups(:one)

    session = Session.new(event_id: event.id, location_id: location.id, meetup_id: meetup.id)

    assert_equal session.average_rating, 0
  end
end
