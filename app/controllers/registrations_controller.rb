class RegistrationsController < Devise::RegistrationsController

  # GET /users
  # GET /users.json
  def index
    @users = User.left_joins(:holdings).group(:id).having('COUNT(holdings.id) > 0')
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end