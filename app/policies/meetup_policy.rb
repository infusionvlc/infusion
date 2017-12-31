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
    !@meetup.nil?
  end

  def vote?
    !@meetup.nil? && !@meetup.assistances.where(user_id: @user.id).exists?
  end

  def create?
    !@user.nil?
  end

  def new?
    create?
  end

  def add_host?
    !@user.nil? && @meetup.holdings.where("user_id = ? AND role < ?", @user.id, 1).exists?
  end

  def update? #admin or mod
    !@user.nil? && @meetup.holdings.where("user_id = ? AND role < ?", @user.id, 2).exists?
  end

  def edit?
    update?
  end

  def destroy? #only admin
    !@user.nil? && @meetup.holdings.where("user_id = ? AND role < ?", @user.id, 1).exists?
  end
end
