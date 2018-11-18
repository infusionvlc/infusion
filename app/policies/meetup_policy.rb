# frozen_string_literal: true

class MeetupPolicy
  # Authorized user and target record
  attr_reader :user, :meetup

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, meetup)
    @user = user
    @meetup = meetup
  end

  # Can the user index records?
  def index?
    true
  end

  # Can the user see a record?
  def show?
    !@meetup.nil? && !@meetup.archived
  end

  # Can the user repeat the meetup?
  def repeat?
    !@user.nil? && !@meetup.on_ranking && @meetup.took_place? && \
      (!@meetup.persisted? || \
      @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 1).exists?)
  end

  # Can the user vote the meetup?
  def vote?
    !@meetup.nil? && !meetup.archived && !@user.nil? &&\
      !@meetup.assistances.where(user_id: @user.id).exists?
  end

  # Can the user unvote the meetup?
  def unvote?
    !@meetup.nil? && !meetup.archived && !@user.nil? && \
      @meetup.assistances.where(user_id: @user.id).exists?
  end

  # Can the user repeat the meetup (as an organizer)?
  def leave?
    !@meetup.nil? && !meetup.archived && !@user.nil? &&\
      @meetup.holdings.where(user_id: @user.id).exists? &&\
      @user != @meetup.holdings.first.user
  end

  # Can the user report a meetup?
  def report?
    @user && !meetup.archived && !Report.where(reportable_id: @meetup.id,
                           reportable_type: 'Meetup',
                           user_id: @user.id).exists?
  end

  # Can the user confirm the meetup?
  def confirm?
    !@meetup.nil? && !meetup.archived && @meetup.confirmation_mail == true
  end

  # Can the user postpone the meetup?
  def delay?
    confirm?
  end

  # Can the user create a record?
  def create?
    !@user.nil?
  end

  # Can the user see the new record form?
  def new?
    create?
  end

  # Can the user add anther organizer to the meetup?
  def add_host?
    !@user.nil? && \
      (!@meetup.persisted? || \
      @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 1).exists?)
  end

  # Can the user update a record?
  # admin or mod
  def update?
    !@user.nil? && @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 2).exists?
  end

  # Can the user see the edit record form?
  def edit?
    update?
  end

  # Can the user delete a record?
  # only admin
  def destroy?
    !@user.nil? && !@user.nil? && \
      @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 1).exists?
  end
end
