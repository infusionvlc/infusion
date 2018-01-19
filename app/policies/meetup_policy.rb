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
    !@meetup.nil? && !@user.nil? &&\
      !@meetup.assistances.where(user_id: @user.id).exists?
  end

  def report?
    @user && !Report.where(reportable_id: @meetup.id,
                           reportable_type: 'Meetup',
                           user_id: @user.id).exists?
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

  def comment?
    !@user.nil? && \
      @meetup.assistances.where('user_id = ? AND review IS NULL', @user.id).exists? && \
      !@meetup.nil? && @meetup.date && @meetup.date <= Date.today
  end

  # admin or mod
  def update?
    !@user.nil? && \
      @meetup.holdings.where('user_id = ? AND role < ?', @user.id, 2).exists?
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
