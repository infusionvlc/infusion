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

  def update?
    !@user.nil? && @meetup.holdings.where(user_id: @user.id).exists?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
