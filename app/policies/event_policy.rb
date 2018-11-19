# frozen_string_literal: true

class EventPolicy
  # Authorized user and target record
  attr_reader :user, :event

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, event)
    @user = user
    @event = event
  end

  # Can the user index records?
  def index?
    @user&.admin?
  end

  # Can the user see a record?
  def create?
    @user&.admin?
  end

  # Can the user see the new record form?
  def new?
    @user&.admin?
  end

  # Can the user update a record?
  def update?
    @user&.admin?
  end

  # Can the user delete a record?
  def destroy?
    @user&.admin?
  end
end
