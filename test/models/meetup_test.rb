require 'test_helper'

class MeetupTest < ActiveSupport::TestCase
  test 'Valid Meetup' do
    meetup = Meetup.new(title: 'TestMeetupTitle',
                        description: 'TestMeetupDescription',
                        requirements: 'TestMeetupRequirementes',
                        date: Date.today, confirmation_mail: false)
    assert meetup.valid?
    puts '\nTest: Meetup -> Valid Meetup'
  end
  test 'Invalid without title' do
    meetup = Meetup.new(description: 'TestMeetupDescription',
                        requirements: 'TestMeetupRequirementes',
                        date: Date.today, confirmation_mail: false)
    refute meetup.valid?, 'Meetup is valid without a Title'
    puts '\nTest: Meetup -> Invalid without title'
  end
  test 'Invalid without description' do
    meetup = Meetup.new(title: 'TestMeetupTitle',
                        requirements: 'TestMeetupRequirementes',
                        date: Date.today, confirmation_mail: false)
    refute meetup.valid?, 'Meetup is valid without a Description'
    puts '\nTest: Meetup -> Invalid without description'
  end
  test 'Invalid without requirements' do
    meetup = Meetup.new(title: 'TestMeetupTitle',
                        description: 'TestMeetupDescription', date: Date.today,
                        confirmation_mail: false)
    refute meetup.valid?, 'Meetup is valid without a Requirements'
    puts '\nTest: Meetup -> Invalid without requirements'
  end
end
