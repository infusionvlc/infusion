# ~/test/models/holding_test.rb
require 'test_helper'

class HoldingTest < ActiveSupport::TestCase
  meetup = Meetup.new(title: 'TestMeetup1', description: 'TestDescription',
                      requirements: 'TestRequirements', date: Date.today,
                      confirmation_mail: false)
    test 'Valid Holding' do
      user = users(:one)
      holding = Holding.new(user_id: user.id, role: 0, meetup_id: meetup.id)
      assert_equal holding.errors.count, 0
      puts '\nTest: Holding -> Valid Holding'
    end
    test 'Invalid without user' do
      user = users(:one)
      holding = Holding.new(role: 0, meetup_id: meetup.id)
      assert_not_equal holding.errors.count, 0,
                       'Holding is valid without an User'
      puts '\nTest: Holding -> Invalid without User'
    end
    test 'Invalid without meetup' do
      user = users(:one)
      holding = Holding.new(user_id: user.id, role: 0)
      assert_not_equal holding.errors.count, 0,
                       'Holding is valid without an Meetup'
      puts '\nTest: Holding -> Invalid without Meetup'
    end
    test 'Invalid without role' do
      user = users(:one)
      holding = Holding.new(user_id: user.id, meetup_id: meetup.id)
      assert_not_equal holding.errors.count, 0,
                       'Holding is valid without an Role'
      puts '\nTest: Holding -> Invalid without Role'
    end
end
