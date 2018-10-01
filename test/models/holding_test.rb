# frozen_string_literal: true

# ~/test/models/holding_test.rb
require 'test_helper'

class HoldingTest < ActiveSupport::TestCase
  test 'Valid Holding' do
    user = users(:one)
    meetup2 = meetups(:one)
    holding = Holding.new(user_id: user.id, role: 0, meetup_id: meetup2.id)
    assert_equal holding.valid?, true
    puts 'Test: Holding -> Valid Holding'
  end
  test 'Invalid without role' do
    user = users(:one)
    meetup2 = meetups(:one)
    holding = Holding.new(user_id: user.id, role: nil, meetup_id: meetup2.id)
    assert_not_equal holding.valid?, true,
                     'Holding is valid without an Role'
    puts 'Test: Holding -> Invalid without Role'
  end
end
