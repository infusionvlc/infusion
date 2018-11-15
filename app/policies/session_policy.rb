# frozen_string_literal: true

class SessionPolicy
  # Authorized user and target record
  attr_reader :user, :session

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, session)
    @user = user
    @session = session
  end

  # Can the user vote the session's meetup?
  def vote?
    !@session.nil? && !session.meetup.archived && !@user.nil? &&\
      !@session.assistances.where(user_id: @user.id).exists?
  end

  # Can the user unvote the session's meetup?
  def unvote?
    !@session.nil? && !session.meetup.archived && !@user.nil? && \
      @session.assistances.where(user_id: @user.id).exists?
  end

  # Can the user leave the session's meetup (as an organizer)?
  def leave?
    !@session.nil? && !session.meetup.archived && !@user.nil? &&\
      @session.holdings.where(user_id: @user.id).exists? &&\
      @user != @session.holdings.first.user
  end

  # Can the user confirm the session?
  def confirm?
    !@session.nil? && !@session.meetup.archived && @session.confirmation_mail == true
  end

  # Can the user postpone the meetup?
  def delay?
    confirm?
  end

  # Can the user comment the session's meetup?
  def comment?
    !@user.nil? && !session.meetup.archived && \
      @session.assistances.where('user_id = ? AND review IS NULL', @user.id).exists? && \
      !@session.nil? && @session&.event&.date <= Date.today && \
      !@session.meetup.holdings.where(user_id: @user.id).exists?
  end

end
