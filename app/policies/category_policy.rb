class CategoryPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def index?
    true
  end

  def show?
    !@category.nil?
  end

  def create?
    !@user.nil? && user.admin?
  end

  def new?
    create?
  end

  def update?
    !@user.nil? && user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
