# frozen_string_literal: true

class ProposalPolicy
  # Authorized user and target record
  attr_reader :user, :proposal

  # Creates instance variables for accessing the current user
  # and the object he/she is interacting with
  def initialize(user, proposal)
    @user = user
    @proposal = proposal
  end

  # Can the user index records?
  def index?
    true
  end

  # Can the user see a record?
  def show?
    !@proposal.nil?
  end

  # Can the user report the proposal?
  def report?
    !@user.nil? && !Report.where(reportable_id: @proposal.id,
                                 reportable_type: 'Proposal',
                                 user_id: @user.id).exists?
  end

  # Can the user vote the proposal?
  def vote?
    !@proposal.nil? && !@user.nil? && \
      !@proposal.votes.where(user_id: @user.id).exists?
  end

  # Can the user create a record?
  def create?
    !@user.nil?
  end

  # Can the user see the new record form?
  def new?
    create?
  end

  # Can the user update a record?
  def update?
    !@user.nil? && !@user.nil? && \
      @proposal.user == @user
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
