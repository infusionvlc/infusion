# ~/test/models/assistance_test.rb
require 'test_helper'

class AssistanceTest < ActiveSupport::TestCase
  test 'Valid Assistance' do
    user = users(:one)
    session = sessions(:one)
    assistance = Assistance.new(user_id: user.id,
                                session_id: session.id,
                                review: '10/10 volveria a acudir')
    assert_equal assistance.valid?, true
    puts 'Test: Assistance -> Valid Assistance'
  end
  test 'Invalid without user' do
    session = sessions(:one)
    assistance = Assistance.new(session_id: session.id,
                                review: '10/10 volveria a acudir')
    assert_not_equal assistance.valid?, true,
                     'Assistance is valid without an User'
    puts 'Test: Assistance -> Invalid without user'
  end
  test 'Invalid without session' do
    user = users(:one)
    assistance = Assistance.new(user_id: user.id,
                                review: '10/10 volveria a acudir')
    assert_not_equal assistance.valid?, true,
                     'Assistance is valid without a session'
    puts 'Test: Assistance -> Invalid without session'
  end
  test 'Invalid without review before session' do
    user = users(:one)
    session = sessions(:one)
    assistance = Assistance.new(user_id: user.id, session_id: session.id)
    assert_equal assistance.valid?, true
    if session.event.date > Date.today
      assert_nil assistance.review,
                 'Assistance is valid without a Review if the session hasnt \
                 taken place'
    end
    puts 'Test: Assistance -> Invalid without review before session'
  end
end
