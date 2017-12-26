class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? nil : user.id
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
