# frozen_string_literal: true

class AssistancePolicy
  # Authorized user and target record
  attr_reader :user, :assistance

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, assistance)
    @user = user
    @assistance = assistance
  end

  # Can the user index records?
  def index?
    true
  end

  # Can the user see a record?
  def show?
    !@assistance.nil?
  end

  # Can the user create a record?
  def create?
    !@user.nil?
  end

  # Can the user report an assistance?
  def report?
    @user && !Report.where(reportable_id: @assistance.id,
                           reportable_type: 'Assistance',
                           user_id: @user.id).exists?
  end

  # Can the user see the new record form?
  def new?
    create?
  end

  # Can the user update a record?
  def update?
    !@user.nil? && @assistance.user == @user && \
                  !@assistance.session.meetup.holdings
                              .where(user_id: @user.id).exists?
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
