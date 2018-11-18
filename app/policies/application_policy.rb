# frozen_string_literal: true

class ApplicationPolicy
  # Authorized user and target record
  attr_reader :user, :record

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, record)
    @user = user
    @record = record
  end

  # Can the user index records?
  def index?
    false
  end

  # Can the user see a record?
  def show?
    scope.where(id: record.id).exists?
  end

  # Can the user create a record?
  def create?
    false
  end

  # Can the user see the new record form?
  def new?
    create?
  end

  # Can the user update a record?
  def update?
    false
  end

  # Can the user see the edit record form?
  def edit?
    update?
  end

  # Can the user delete a record?
  def destroy?
    false
  end

  # Defines the pundit policy scope depending on the record class
  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Application scope
  class Scope
    # Authorized user and current scope
    attr_reader :user, :scope

    # Creates instance variables for accessing the current user
    # and the scope he/she is interacting with
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    # Returns the current scope
    def resolve
      scope
    end
  end
end
