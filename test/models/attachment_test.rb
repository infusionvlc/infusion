# ~/test/models/attachment_test.rb
require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  meetup = Meetup.new(title: 'TestMeetup1', description: 'TestDescription',
                      requirements: 'TestRequirements', date: Date.today,
                      confirmation_mail: false)
  test 'Valid Attachment' do
    attachment = Attachment.new(meetup_id: meetup.id)
    assert_equal attachment.errors.count, 0
    puts '\nTest: Attachment -> Valid Attachment'
  end
  test 'Invalid without meetup' do
    user = users(:one)
    attachment = Attachment.new()   
    assert_not_equal attachment.errors.count, 0,
                     'Attachment is valid without a Meetup'
    puts '\nTest: Attachment -> Invalid without meetup'
  end
end
