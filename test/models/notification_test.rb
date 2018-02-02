require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test 'Valid Notification' do
    notification = Notification.new(user_id: users(:one).id, activity_id: activities(:one).id)
    assert_equal notification.valid?, true
    puts '\nTest: Notification -> Valid Notification'
  end

  test 'Invalid without user_id' do
    notification = Notification.new(activity_id: activities(:one).id)
    refute notification.valid?, 'Notification is valid without a user_id'
    puts '\nTest: Notification -> Invalid without user_id'
  end

  test 'Invalid without activity_id' do
    notification = Notification.new(user_id: users(:one).id)
    refute notification.valid?, 'Notification is valid without a activity_id'
    puts '\nTest: Notification -> Invalid without activity_id'
  end
end
