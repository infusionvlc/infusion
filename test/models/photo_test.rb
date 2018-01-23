# ~/test/models/photo_test.rb
require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

	meetup = Meetup.new(title: "TestMeetup1", description: "TestDescription", requirements: "TestRequirements", date: Date.today, confirmation_mail: false)

	test 'Valid Photo' do
		photo = Photo.new(title: "TestTitle1", meetup_id: meetup.id, attribution: "TestAttribution")
		assert_equal photo.errors.count, 0
		puts "\nTest: Photo -> Valid Photo"
	end

	test 'Invalid without title' do
		photo = Photo.new(meetup_id: meetup.id, attribution: "TestAttribution")
		assert_not_equal photo.errors.count, 0, 'Photo is valid without an User'
		puts "\nTest: Photo -> Invalid without user"
	end

	test 'Invalid without meetup' do
		photo = Photo.new(title: "TestTitle1", attribution: "TestAttribution")
		assert_not_equal photo.errors.count, 0, 'Photo is valid without a Meetup'
		puts "\nTest: Photo -> Invalid without meetup"
	end

	test 'Invalid without attribution' do
		photo = Photo.new(title: "TestTitle1", meetup_id: meetup.id)
		assert_not_equal photo.errors.count, 0, 'Photo is valid without an Attribution'
		puts "\nTest: Photo -> Invalid without attribution"
	end
end
