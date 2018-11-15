# frozen_string_literal: true

class MeetupPolicy
  attr_reader :user, :meetup

  def initialize(user, meetup)
    @user = user
    @meetup = meetup
  end

  def index?
    true
  end

  def show?
    !@meetup.nil? && !@meetup.archived
  end

  def repeat?
    puts !@user.nil?
    puts !@meetup.on_ranking
    puts @meetup.took_place?
    !@user.nil? && !@meetup.on_ranking && @meetup.took_place? && \
      (!@meetup.persisted? || \
      @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 1).exists?)
  end

  def vote?
    !@meetup.nil? && !meetup.archived && !@user.nil? &&\
      !@meetup.assistances.where(user_id: @user.id).exists?
  end

  def unvote?
    !@meetup.nil? && !meetup.archived && !@user.nil? && \
      @meetup.assistances.where(user_id: @user.id).exists?
  end

  def leave?
    !@meetup.nil? && !meetup.archived && !@user.nil? &&\
      @meetup.holdings.where(user_id: @user.id).exists? &&\
      @user != @meetup.holdings.first.user
  end

  def report?
    @user && !meetup.archived && !Report.where(reportable_id: @meetup.id,
                           reportable_type: 'Meetup',
                           user_id: @user.id).exists?
  end

  def confirm?
    !@meetup.nil? && !meetup.archived && @meetup.confirmation_mail == true
  end

  def delay?
    confirm?
  end

  def create?
    !@user.nil?
  end

  def new?
    create?
  end

  def add_host?
    !@user.nil? && \
      (!@meetup.persisted? || \
      @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 1).exists?)
  end

  # admin or mod
  def update?
    !@user.nil? && @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 2).exists?
  end

  def edit?
    update?
  end

  # only admin
  def destroy?
    !@user.nil? && !@user.nil? && \
      @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 1).exists?
  end
end
