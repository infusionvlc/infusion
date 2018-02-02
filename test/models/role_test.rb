# ~/test/models/role_test.rb
require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'Valid Role' do
    role = Role.new(name: 'TestName')
    assert_equal role.valid?, true
    puts 'Test: Role -> Valid Role'
  end
  test 'Invalid without name' do
    role = Role.new
    assert_not_equal role.valid?, true, 'Role is valid without a Name'
    puts 'Test: Role -> Invalid without name'
  end
end
