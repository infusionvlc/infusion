# frozen_string_literal: true

require 'test_helper'
class ActivityTest < ActiveSupport::TestCase
  test 'Valid Activity' do
    meetup = meetups(:one)
    user = users(:one)
    session = sessions(:one)

    activity = Activity.new(user_id: user.id, objective_id: meetup.id, objective_type: 'Meetup' )
    assert_equal activity.valid?, true
    assert_equal activity.activity_title, meetup.title
    puts 'Test: Activity -> Valid Activity'
  end

  test 'Invalid without user_id' do
    meetup = meetups(:one)
    user = users(:one)
    session = sessions(:one)

    activity = Activity.new(objective_id: session.id, objective_type: 'Meetup')
    refute activity.valid?, 'Activity is valid without a user_id'
    assert_equal activity.activity_title, meetup.title
    puts 'Test: Activity -> Invalid without user_id'
  end

  test 'Invalid without objective_id' do
    meetup = meetups(:one)
    user = users(:one)
    session = sessions(:one)

    activity = Activity.new(user_id: user.id, objective_type: 'Meetup')
    refute activity.valid?, 'Activity is valid without a objective_id'
    puts 'Test: Activity -> Invalid without objective_id'
  end

  test 'Invalid without objective_type' do
    meetup = meetups(:one)
    user = users(:one)
    session = sessions(:one)

    activity = Activity.new(user_id: user.id, objective_id: session.id)
    refute activity.valid?, 'Activity is valid without a objective_type'
    assert_equal activity.activity_title, meetup.title
    puts 'Test: Activity -> Invalid without objective_type'
  end
end
