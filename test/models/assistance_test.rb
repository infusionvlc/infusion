# ~/test/models/assistance_test.rb
require 'test_helper'

class AssistanceTest < ActiveSupport::TestCase
  test 'Valid Assistance' do
    user = users(:one)
    meetup = meetups(:one)
    assistance = Assistance.new(user_id: user.id,
                                meetup_id: meetup.id,
                                review: '10/10 volveria a acudir')
    assert_equal assistance.valid?, true
    puts 'Test: Assistance -> Valid Assistance'
  end
  test 'Invalid without user' do
    meetup = meetups(:one)
    assistance = Assistance.new(meetup_id: meetup.id,
                                review: '10/10 volveria a acudir')
    assert_not_equal assistance.valid?, true,
                     'Assistance is valid without an User'
    puts 'Test: Assistance -> Invalid without user'
  end
  test 'Invalid without meetup' do
    user = users(:one)
    assistance = Assistance.new(user_id: user.id,
                                review: '10/10 volveria a acudir')
    assert_not_equal assistance.valid?, true,
                     'Assistance is valid without a Meetup'
    puts 'Test: Assistance -> Invalid without meetup'
  end
  test 'Invalid without review before meetup' do
    user = users(:one)
    meetup = meetups(:one)
    assistance = Assistance.new(user_id: user.id, meetup_id: meetup.id)
    assert_equal assistance.valid?, true
    if meetup.date > Date.today
      assert_nil assistance.review,
                 'Assistance is valid without a Review if the Meetup hasnt \
                 taken place'
    end
    puts 'Test: Assistance -> Invalid without review before meetup'
  end
end
