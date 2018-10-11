# frozen_string_literal: true
require 'test_helper'

class PagesFlowTest < ActionDispatch::IntegrationTest
  test 'about page' do
    visit root_path
    click_link 'About'
    assert_current_path about_path
  end

  test 'hacktoberfest page' do
    visit hacktoberfest_path
    assert_current_path hacktoberfest_path
  end

  test 'rules page' do
    visit rules_path
    assert_current_path rules_path
  end

  test 'reglas page' do
    visit reglas_path
    assert_current_path reglas_path
  end

  test 'regles page' do
    visit regles_path
    assert_current_path regles_path
  end
end
