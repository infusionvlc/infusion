# ~/test/models/assistance_test.rb
require 'test_helper'

class AssistanceTest < ActiveSupport::TestCase
  meetup = Meetup.new(title: 'TestMeetup1',
                      description: 'TestDescription',
                      requirements: 'TestRequirements',
                      date: Date.today,
                      confirmation_mail: false)
  test 'Valid Assistance' do
    user = users(:one)
    assistance = Assistance.new(user_id: user.id,
                                meetup_id: meetup.id,
                                review: '10/10 volveria a acudir')
    assert_equal assistance.errors.count, 0
    puts '\nTest: Assistance -> Valid Assistance'
  end
  test 'Invalid without user' do
    assistance = Assistance.new(meetup_id: meetup.id,
                                review: '10/10 volveria a acudir')
    assert_not_equal assistance.errors.count, 0,
                     'Assistance is valid without an User'
    puts '\nTest: Assistance -> Invalid without user'
  end
  test 'Invalid without meetup' do
    user = users(:one)
    assistance = Assistance.new(user_id: user.id,
                                review: '10/10 volveria a acudir')
    assert_not_equal assistance.errors.count, 0,
                     'Assistance is valid without a Meetup'
    puts '\nTest: Assistance -> Invalid without meetup'
  end
  test 'Invalid without review before meetup' do
    user = users(:one)
    assistance = Assistance.new(user_id: user.id, meetup_id: meetup.id)
    assert_equal assistance.errors.count, 0 
    if meetup.date > Date.today
      assert_nil assistance.review,
                 'Assistance is valid without a Review if the Meetup hasnt \
                 taken place'
    end
    puts '\nTest: Assistance -> Invalid without review before meetup'
  end
end
