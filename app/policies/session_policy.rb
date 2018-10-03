# frozen_string_literal: true

class SessionPolicy
  attr_reader :user, :session

  def initialize(user, session)
    @user = user
    @session = session
  end

  def vote?
    !@session.nil? && !session.meetup.archived && !@user.nil? &&\
      !@session.assistances.where(user_id: @user.id).exists?
  end

  def unvote?
    !@session.nil? && !session.meetup.archived && !@user.nil? && \
      @session.assistances.where(user_id: @user.id).exists?
  end

  def leave?
    !@session.nil? && !session.meetup.archived && !@user.nil? &&\
      @session.holdings.where(user_id: @user.id).exists? &&\
      @user != @session.holdings.first.user
  end

  def confirm?
    !@session.nil? && !@session.meetup.archived && @session.confirmation_mail == true
  end

  def delay?
    confirm?
  end

  def comment?
    !@user.nil? && !session.meetup.archived && \
      @session.assistances.where('user_id = ? AND review IS NULL', @user.id).exists? && \
      !@session.nil? && @session&.event&.date <= Date.today && \
      !@session.meetup.holdings.where(user_id: @user.id).exists?
  end

end
