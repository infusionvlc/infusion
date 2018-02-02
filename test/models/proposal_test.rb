# ~/test/models/proposal_test.rb
require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  test 'Valid Proposal' do
    user = users(:one)
    proposal = Proposal.new(user_id: user.id, title: 'TestTitle', 
      description: 'TestDescription')
    assert_equal proposal.errors.count, 0
    puts '\nTest: Proposal -> Valid Proposal'
  end
  test 'Invalid without user' do
    proposal = Proposal.new(title: 'TestTitle', description: 'TestDescription')
    assert_not_equal proposal.errors.count, 0, 
      'Proposal is valid without an User'
    puts '\nTest: Proposal -> Invalid without user'
  end
  test 'Invalid without title' do
    user = users(:one)
    proposal = Proposal.new(user_id: user.id, description: 'TestDescription')
    assert_not_equal proposal.errors.count, 0, 
      'Proposal is valid without an Title'
    puts '\nTest: Proposal -> Invalid without title'
  end
  test 'Invalid without description' do
    user = users(:one)
    proposal = Proposal.new(user_id: user.id, title: 'TestTitle')
    assert_not_equal proposal.errors.count, 0, 
      'Proposal is valid without an Description'
    puts '\nTest: Proposal -> Invalid without description'
  end
end
