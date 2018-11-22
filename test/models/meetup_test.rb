# frozen_string_literal: true

require 'test_helper'

class MeetupTest < ActiveSupport::TestCase
  test 'Valid Meetup' do
    location = locations(:one)
    meetup = Meetup.new(title: 'TestMeetupTitle',
                        description: 'a' * 257,
                        requirements: 'TestMeetupRequirementes',
                        confirmation_mail: false)
    assert_equal meetup.valid?, true
    puts 'Test: Meetup -> Valid Meetup'
  end
  test 'Invalid without title' do
    location = locations(:one)
    meetup = Meetup.new(description: 'TestMeetupDescription',
                        requirements: 'TestMeetupRequirementes',
                        confirmation_mail: false)
    assert_not_equal meetup.valid?, true,
                     'Meetup is valid without a Title'
    puts 'Test: Meetup -> Invalid without title'
  end
  test 'Invalid without description' do
    location = locations(:one)
    meetup = Meetup.new(title: 'TestMeetupTitle',
                        requirements: 'TestMeetupRequirementes',
                        confirmation_mail: false)
    assert_not_equal meetup.valid?, true,
                     'Meetup is valid without a Description'
    puts 'Test: Meetup -> Invalid without description'
  end
  test 'Invalid without requirements' do
    location = locations(:one)
    meetup = Meetup.new(title: 'TestMeetupTitle',
                        description: 'TestMeetupDescription',
                        confirmation_mail: false)
    assert_not_equal meetup.valid?, true,
                     'Meetup is valid without a Requirements'
    puts 'Test: Meetup -> Invalid without requirements'
  end
end
