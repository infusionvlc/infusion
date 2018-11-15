# frozen_string_literal: true

class LocationPolicy
  # Authorized user and target record
  attr_reader :user, :location

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, location)
    @user = user
    @location = location
  end

  # Can the user index records?
  def index?
    true
  end

  # Can the user see a record?
  def show?
    !@location.nil?
  end

  # Can the user create a record?
  def create?
    !@user.nil? && @user.admin?
  end

  # Can the user see the new record form?
  def new?
    create?
  end

  # Can the user update a record?
  def update?
    !@user.nil? && @user.admin?
  end

  # Can the user see the edit record form?
  def edit?
    update?
  end

  # Can the user delete a record?
  def destroy?
    update?
  end
end
