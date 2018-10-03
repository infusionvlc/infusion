# frozen_string_literal: true

class ProposalPolicy
  attr_reader :user, :proposal

  def initialize(user, proposal)
    @user = user
    @proposal = proposal
  end

  def index?
    true
  end

  def show?
    !@proposal.nil?
  end

  def report?
    !@user.nil? && !Report.where(reportable_id: @proposal.id,
                                 reportable_type: 'Proposal',
                                 user_id: @user.id).exists?
  end

  def vote?
    !@proposal.nil? && !@user.nil? && \
      !@proposal.votes.where(user_id: @user.id).exists?
  end

  def create?
    !@user.nil?
  end

  def new?
    create?
  end

  def update?
    !@user.nil? && !@user.nil? && \
      @proposal.user == @user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
