# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  include MarkdownConcern

  # GET /users
  # GET /users.json
  def index
    @users = User.where(contributor: true)
  end

  # POST /users
  # POST /users.json
  def create
    super do
        resource.role_id = 1
        resource.save
    end
  end

  def save_locale
    current_user.update(locale: params[:locale])
    redirect_back(fallback_location: root_path)
  end

  protected

  # Updates a user with the default role
  def update_resource(resource, params)
    resource.role_id = 1
    resource.update_without_password(params)
  end

  # Sets a default redirection path for users
  def after_update_path_for(resource)
    "/#{resource.username}"
  end

end
