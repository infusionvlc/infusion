# frozen_string_literal: true

class ReportPolicy
  # Authorized user and target record
  attr_reader :user, :report

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, report)
    @user = user
    @report = report
  end

  # Can the user index records?
  def index?
    !@user.nil? && @user.admin?
  end

  # Can the user create a record?
  def create?
    !@user.nil?
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
