# frozen_string_literal: true

# ~/test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Valid User' do
    role = roles(:one)
    user = User.new(username: 'TestUser',
                    email: 'test@email.com',
                    role_id: role.id,
                    password: 'password123',
                    password_confirmation: 'password123')
    assert_equal user.valid?, true
    puts 'Test: User -> Valid User'
  end
  test 'Invalid without username' do
    role = roles(:one)
    user = User.new(locale: 'es',
                    role_id: role.id,
                    password: 'password123',
                    password_confirmation: 'password123')
    assert_not_equal user.valid?, true,
                     'User is valid without username'
    puts 'Test: User -> Invalid without username'
  end
  test 'Invalid without locale' do
    role = roles(:one)
    user = User.new(username: 'TestUser',
                    role_id: role.id,
                    password: 'password123',
                    password_confirmation: 'password123')
    assert_not_equal user.valid?, true, 'User is valid without locale'
    puts 'Test: User -> Invalid without locale'
  end
  test 'Invalid without role_id' do
    user = User.new(username: 'TestUser',
                    locale: 'es',
                    password: 'password123',
                    password_confirmation: 'password123')
    assert_not_equal user.valid?, true, 'User is valid without role_id'
    puts 'Test: User -> Invalid without role_id'
  end
end
