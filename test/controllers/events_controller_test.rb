require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index if user is admin" do
    sign_in users(:one)
    get events_path
    assert_response :success
  end

  test "should not get index if user is not admin" do
    get events_path
    assert_response :redirect
  end

  test "should be able to see the new event form if user is admin" do
    sign_in users(:one)
    get new_event_path
    assert_response :success
  end

  test "should not be able to see the new event form if not an adin" do
    get new_event_path
    assert_response :redirect
  end

  test 'should create new event with date' do
    post events_path,
         params: { event: { date: Date.today } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should remove an event' do
    sign_in users(:one)
    delete event_path(1)
    follow_redirect!
    assert_response :success
  end

end
