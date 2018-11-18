# frozen_string_literal: true

module ProposalsHelper
  # Returns current proposal's votes count
  def proposal_votes(proposal)
    count = proposal.votes.size
    I18n.t 'proposal.votes', count: count
  end
end
