# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  include MarkdownConcern

  # GET /users
  # GET /users.json
  def index
    @users = User.where(contributor: true)
  end

  def create
    super do
        resource.role_id = 1
        resource.save
    end
  end

  protected

  def update_resource(resource, params)
    resource.role_id = 1
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    "/#{resource.username}"
  end

end
