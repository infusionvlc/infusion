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
  test 'Invalid without title' do
    meetup2 = meetups(:one)
    photo = Photo.new(meetup_id: meetup2.id, attribution: 'TestAtribution')
    assert_not_equal photo.valid?, true,
                     'Photo is valid without a title'
    puts 'Test: Photo -> Invalid without user'
  end
  test 'Invalid without meetup' do
    photo = Photo.new(title: 'TestTitle1', attribution: 'TestAttribution')
    assert_not_equal photo.valid?, true,
                     'Photo is valid without a Meetup'
    puts 'Test: Photo -> Invalid without meetup'
  end
end
