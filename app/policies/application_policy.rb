# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    # Creates instance variables for accessing the current user
    # and the scope he/she is interacting with
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
