# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'get about page should show the page' do
    get '/about'
    assert_response :success
  end

  test 'get rules page should show the page' do
    get '/rules'
    assert_response :success
  end

  test 'get reglas page should show the page' do
    get '/reglas'
    assert_response :success
  end

  test 'get regles page should show the page' do
    get '/regles'
    assert_response :success
  end

  test 'get hacktoberfest page should show the page' do
    get '/hacktoberfest'
    assert_response :success
  end
end
