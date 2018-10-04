# frozen_string_literal: true

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test 'Valid Activity' do
    activity = Activity.new(user_id: users(:one).id, objective_id: meetups(:one).id, objective_type: 'Meetup' )
    assert_equal activity.valid?, true
    puts '\nTest: Activity -> Valid Activity'
  end

  test 'Invalid without user_id' do
    activity = Activity.new(objective_id: sessions(:one).id,
                            objective_type: 'Meetup')
    refute activity.valid?, 'Activity is valid without a user_id'
    puts '\nTest: Activity -> Invalid without user_id'
  end

  test 'Invalid without objective_id' do
    activity = Activity.new(user_id: users(:one).id,
                            objective_type: 'Meetup')
    refute activity.valid?, 'Activity is valid without a objective_id'
    puts '\nTest: Activity -> Invalid without objective_id'
  end

  test 'Invalid without objective_type' do
    activity = Activity.new(user_id: users(:one).id,
                            objective_id: sessions(:one).id)
    refute activity.valid?, 'Activity is valid without a objective_type'
    puts '\nTest: Activity -> Invalid without objective_type'
  end

end
