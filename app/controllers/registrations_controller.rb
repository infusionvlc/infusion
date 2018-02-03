class RegistrationsController < Devise::RegistrationsController

  # GET /users
  # GET /users.json
  def index
    @users = User.left_joins(:holdings).group(:id)
                 .having('COUNT(holdings.id) > 0')
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

end