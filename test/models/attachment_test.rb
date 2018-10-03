# frozen_string_literal: true

# ~/test/models/attachment_test.rb
require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  test 'Valid Attachment' do
    meetup2 = meetups(:one)
    attachment = Attachment.new(meetup_id: meetup2.id)
    assert_equal attachment.valid?, true, 'Attachment is invalid with full
    initialization'
    puts 'Test: Attachment -> Valid Attachment'
  end

end
