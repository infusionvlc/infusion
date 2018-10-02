require 'test_helper'

class MeetupsControllerTest < ActionDispatch::IntegrationTest
  test 'should show main page' do
    get '/meetups/index'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should redirect to meetup page if there is not id in params' do
    get '/meetups/new'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should redirect to main page if the id in params is not valid' do
    get '/meetups/1'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
