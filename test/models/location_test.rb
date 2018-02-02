require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  test 'Invalid without name' do
    location = Location.new()
    refute location.valid?, 'Location is valid without a Name'
    puts "\nTest: Location -> Invalid without name"
  end
end
