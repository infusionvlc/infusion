# frozen_string_literal: true

require 'test_helper'

class RegistrationFlowTest < ActionDispatch::IntegrationTest
  test 'register user' do
    visit root_path
    click_link 'Únete'
    assert_current_path new_user_registration_path

    fill_in 'user_username', with: 'pepe'
    fill_in 'user_email', with: 'pepe@pepe.com'
    fill_in 'user_password', with: 'pepepe'
    fill_in 'user_password_confirmation', with: 'pepepe'

    click_on 'Registrarme'

    assert_current_path meetups_path
  end

  test 'trying to register user without password' do
    visit root_path
    click_link 'Únete'
    assert_current_path new_user_registration_path

    fill_in 'user_username', with: 'pepe'
    fill_in 'user_email', with: 'pepe@pepe.com'

    click_on 'Registrarme'

    assert_current_path users_path

    page.has_content?('Email no puede estar en blanco')
    page.has_content?('Contraseña no puede estar en blanco')
    page.has_content?('Nombre de usuario no puede estar en blanco')
  end
end
