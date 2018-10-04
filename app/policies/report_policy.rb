# frozen_string_literal: true

class ReportPolicy
  attr_reader :user, :report

  def initialize(user, report)
    @user = user
    @report = report
  end

  def index?
    !@user.nil? && @user.admin?
  end

  def create?
    !@user.nil?
  end

  def new?
    create?
  end

  def update?
    !@user.nil? && @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
