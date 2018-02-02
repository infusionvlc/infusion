# ~/test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test 'Valid User' do 
      user = User.new(reset_password_token: 'TestPasswordToken',
        reset_password_sent_at: DateTime.now,
        remember_created_at: DateTime.now, current_sign_in_at: DateTime.now,
        last_sign_in_at: DateTime.now, current_sign_in_ip: '127.0.0.1',
        last_sign_in_ip: '127.0.0.1', username: 'TestUser', locale: 'es',
        avatar_file_name: 'TestName', avatar_content_type: 'image',
        avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1,
        bio: 'TestBio')
      assert_equal user.errors.count, 0
      puts '\nTest: User -> Valid User'
    end
    test 'Invalid without username' do
       user = User.new(reset_password_token: 'TestPasswordToken',
        reset_password_sent_at: DateTime.now,
        remember_created_at: DateTime.now, current_sign_in_at: DateTime.now,
        last_sign_in_at: DateTime.now, current_sign_in_ip: '127.0.0.1',
        last_sign_in_ip: '127.0.0.1', locale: 'es',
        avatar_file_name: 'TestName', avatar_content_type: 'image',
        avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1,
        bio: 'TestBio')
      assert_not_equal user.errors.count, 0,
      'User is valid username Reset_password_token'
      puts '\nTest: User -> Invalid without username'
    end
    test 'Invalid without locale' do
       user = User.new(reset_password_token: 'TestPasswordToken',
        reset_password_sent_at: DateTime.now,
        remember_created_at: DateTime.now, current_sign_in_at: DateTime.now,
        last_sign_in_at: DateTime.now, current_sign_in_ip: '127.0.0.1',
        last_sign_in_ip: '127.0.0.1', username: 'TestUser',
        avatar_file_name: 'TestName', avatar_content_type: 'image',
        avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1,
        bio: 'TestBio')
      assert_not_equal user.errors.count, 0, 'User is valid without locale'
      puts '\nTest: User -> Invalid without locale'
    end
    test 'Invalid without role_id' do
       user = User.new(reset_password_token: 'TestPasswordToken',
        reset_password_sent_at: DateTime.now,
        remember_created_at: DateTime.now, current_sign_in_at: DateTime.now,
        last_sign_in_at: DateTime.now, current_sign_in_ip: '127.0.0.1',
        last_sign_in_ip: '127.0.0.1', username: 'TestUser', locale: 'es',
        avatar_file_name: 'TestName', avatar_content_type: 'image',
        avatar_file_size: 10, avatar_updated_at: DateTime.now, bio: 'TestBio')
      assert_not_equal user.errors.count, 0, 'User is valid without role_id'
      puts '\nTest: User -> Invalid without role_id'
    end
    test 'Invalid without bio' do
       user = User.new(reset_password_token: 'TestPasswordToken',
        reset_password_sent_at: DateTime.now,
        remember_created_at: DateTime.now, current_sign_in_at: DateTime.now,
        last_sign_in_at: DateTime.now, current_sign_in_ip: '127.0.0.1',
        last_sign_in_ip: '127.0.0.1', username: 'TestUser', locale: 'es',
        avatar_file_name: 'TestName', avatar_content_type: 'image',
        avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1)
      assert_not_equal user.errors.count, 0, 'User is valid without bio'
      puts '\nTest: User -> Invalid without bio'
    end
end
