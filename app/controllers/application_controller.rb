# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery prepend: true, with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :set_notifications

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def set_notifications
    @notifications = current_user.notifications.where(read: false) if user_signed_in?
  end

  def set_locale
    @locales = [
      { name: t('languages.ca'), locale: :ca },
      { name: t('languages.en'), locale: :en },
      { name: t('languages.es'), locale: :es }
    ].freeze
    @locale = I18n.locale = locale
  end

  def locale
    params[:locale] || current_user&.locale || cookies[:locale] ||
      I18n.default_locale
  end

  def set_locale_cookie(locale)
    cookies['locale'] = locale.to_s
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || meetups_path
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :bio, :locale, :password, :password_confirmation,
                   :remember_me, :notify_meetups, :notify_proposals, :notify_comments, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def user_not_authorized
    flash[:alert] = I18n.t 'main.pundit_error'
    redirect_to(request.referrer || meetups_path)
  end
end
