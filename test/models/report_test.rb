# frozen_string_literal: true

# ~/test/models/report_test.rb
require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'Valid Report' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 2,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_equal report.valid?, true, 'Proposal is invalid with all info'
    puts 'Test: Report -> Valid Report'
  end
  test 'Invalid without title' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(type_of: 2,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_not_equal report.valid?, true, 'Proposal is valid without Title'
    puts 'Test: Report -> Invalid without title'
  end
  test 'Invalid without type_of' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_not_equal report.valid?, true, 'Proposal is valid without Type_of'
    puts 'Test: Report -> Invalid without type_of'
  end
  test 'Invalid without reportable_type' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 2,
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_not_equal report.valid?, true,
                     'Proposal is valid without Reportable_type'
    puts 'Test: Report -> Invalid without reportable_type'
  end
  test 'Invalid without user_id' do
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 2,
                        reportable_type: 'Meetup',
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_not_equal report.valid?, true, 'Proposal is valid without User'
    puts 'Test: Report -> Invalid without user_id'
  end
  test 'Invalid without reportable_id' do
    user = users(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 2,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        description: 'TestDescritpion')
    assert_not_equal report.valid?, true,
                     'Proposal is valid without Reportable_id'
    puts 'Test: Report -> Invalid without reportable_id'
  end
  test 'Invalid without description' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 2,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id)
    assert_not_equal report.valid?, true,
                     'Proposal is valid without Description'
    puts 'Test: Report -> Invalid without description'
  end
end
