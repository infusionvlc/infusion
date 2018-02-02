# ~/test/model/vote_test.rb
require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'Valid Vote' do
    user = users(:one)
    proposal = proposals(:one)
    vote = Vote.new(user_id: user.id, proposal_id: proposal.id)
    assert_equal vote.valid?, true
    puts 'Test: Vote -> Valid Vote'
  end
  test 'Invalid without user' do
    proposal = proposals(:one)
    vote = Vote.new(proposal_id: proposal.id)
    assert_not_equal vote.valid?, true, 'Vote is valid without an User'
    puts 'Test: Vote -> Invalid without user'
  end
  test 'Invalid without proposal' do
    user = users(:one)
    vote = Vote.new(user_id: user.id)
    assert_not_equal vote.valid?, true, 'Vote is valid without a Proposal'
    puts 'Test: Vote -> Invalid without Proposal'
  end
end
