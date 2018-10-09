# frozen_string_literal: true

# ~/test/models/photo_test.rb
require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test 'Valid Photo' do
    meetup2 = meetups(:one)
    photo = Photo.new(title: 'TestTitle1',
                      meetup_id: meetup2.id,
                      attribution: 'TestAttribution')
    assert_equal photo.valid?, true
    puts 'Test: Photo -> Valid Photo'
  end
end
