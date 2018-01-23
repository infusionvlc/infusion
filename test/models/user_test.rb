# ~/test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  	test 'Valid User' do 
  		user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_equal user.errors.count, 0
  		puts "\nTest: User -> Valid User"
  	end

  	test 'Invalid without reset_password_token' do
  		 user = User.new(reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without Reset_password_token'
  		puts "\nTest: User -> Invalid without reset_password_token"
  	end

  	test 'Invalid without reset_password_sent_at' do
  		 user = User.new(reset_password_token: "TestPasswordToken", remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without reset_password_sent_at'
  		puts "\nTest: User -> Invalid without reset_password_sent_at"
  	end

  	test 'Invalid without remember_created_at' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without remember_created_at'
  		puts "\nTest: User -> Invalid without remember_created_at"
  	end

  	test 'Invalid without current_sign_in_at' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without current_sign_in_at'
  		puts "\nTest: User -> Invalid without current_sign_in_at"
  	end

  	test 'Invalid without last_sign_in_at' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without last_sign_in_at'
  		puts "\nTest: User -> Invalid without last_sign_in_at"
  	end

  	test 'Invalid without current_sign_in_ip' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without current_sign_in_ip'
  		puts "\nTest: User -> Invalid without current_sign_in_ip"
  	end

  	test 'Invalid without last_sign_in_ip' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without last_sign_in_ip'
  		puts "\nTest: User -> Invalid without last_sign_in_ip"
  	end

  	test 'Invalid without username' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid username Reset_password_token'
  		puts "\nTest: User -> Invalid without username"
  	end

  	test 'Invalid without locale' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without locale'
  		puts "\nTest: User -> Invalid without locale"
  	end

  	test 'Invalid without avatar_file_name' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without avatar_file_name'
  		puts "\nTest: User -> Invalid without avatar_file_name"
  	end

  	test 'Invalid without avatar_content_type' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without avatar_content_type'
  		puts "\nTest: User -> Invalid without avatar_content_type"
  	end

  	test 'Invalid without avatar_file_size' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_updated_at: DateTime.now, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without avatar_file_size'
  		puts "\nTest: User -> Invalid without avatar_file_size"
  	end

  	test 'Invalid without avatar_updated_at' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, role_id: 1, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without avatar_updated_at'
  		puts "\nTest: User -> Invalid without avatar_updated_at"
  	end

  	test 'Invalid without role_id' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, bio: "TestBio")
  		assert_not_equal user.errors.count, 0, 'User is valid without role_id'
  		puts "\nTest: User -> Invalid without role_id"
  	end

  	test 'Invalid without bio' do
  		 user = User.new(reset_password_token: "TestPasswordToken", reset_password_sent_at: DateTime.now, remember_created_at: DateTime.now, current_sign_in_at: DateTime.now, last_sign_in_at: DateTime.now, current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "TestUser", locale: "es", avatar_file_name: "TestName", avatar_content_type: "image", avatar_file_size: 10, avatar_updated_at: DateTime.now, role_id: 1)
  		assert_not_equal user.errors.count, 0, 'User is valid without bio'
  		puts "\nTest: User -> Invalid without bio"
  	end
end
