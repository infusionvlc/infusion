class LocationPolicy
  attr_reader :user, :location

  def initialize(user, location)
    @user = user
    @location = location
  end

  def index?
    true
  end

  def show?
    !@location.nil?
  end

  def create?
    !@user.nil? && @user.admin?
  end

  def new?
    create?
  end

  def update?
    !@user.nil? && @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
