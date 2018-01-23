# ~/test/model/vote_test.rb
require 'test_helper'

class VoteTest < ActiveSupport::TestCase

	test 'Valid Vote' do
		user = users(:one)
		proposal = Proposal.new(user_id: user.id, title: "TestTitle", description: "TestDescription")
		vote = Vote.new(user_id: user.id, proposal_id: proposal.id)
		assert_equal vote.errors.count, 0
		puts "\nTest: Vote -> Valid Vote"
	end

	test 'Invalid without user' do
		user = users(:one)
		proposal = Proposal.new(user_id: user.id, title: "TestTitle", description: "TestDescription")
		vote = Vote.new(proposal_id: proposal.id)
		assert_not_equal vote.errors.count, 0, 'Vote is valid without an User'
		puts "\nTest: Vote -> Invalid without user"
	end

	test 'Invalid without proposal' do
		user = users(:one)
		vote = Vote.new(user_id: user.id)
		assert_not_equal vote.errors.count, 0, 'Vote is valid without a Proposal'
		puts "\nTest: Vote -> Invalid without Proposal"
	end
end
