module ProposalsHelper
  def proposal_votes(proposal)
    count = proposal.votes.size
    I18n.t 'proposal.votes', count: count
  end
end
