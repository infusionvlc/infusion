require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test 'Invalid without name' do
    location = Location.new
    assert_not_equal location.valid?, true, 'Location is valid without a Name'
    puts 'Test: Location -> Invalid without name'
  end
end
