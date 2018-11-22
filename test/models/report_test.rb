# frozen_string_literal: true

# ~/test/models/report_test.rb
require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'Invalid without title' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(type_of: 2,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_not_equal report.valid?, true, 'Proposal is valid without Title'
    assert_equal report.text_type, 'Pornografía'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
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
    assert_equal report.reportable_title, meetup.title
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
                     assert_equal report.text_type, 'Pornografía'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
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
    assert_equal report.text_type, 'Pornografía'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
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
    assert_equal report.text_type, 'Pornografía'
    assert_equal report.text_status, 'Abierta'
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
    assert_equal report.text_type, 'Pornografía'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
    puts 'Test: Report -> Invalid without description'
  end

  test 'Report with a valid type' do
    user = users(:one)
    meetup = meetups(:one)

    types = {0 => 'hate', 
             1 => 'menace', 
             2 => 'pornography', 
             3 => 'community', 
             4 => 'other'}
    types.each do |report_type, report_name|
      report = Report.new(title: 'TestTitle',
                        type_of: report_type,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')

      assert_equal report.valid?, true, 'Proposal is invalid with all info'
      assert_equal report.text_type, I18n.t("report.type.#{report_name}")
      assert_equal report.text_status, I18n.t('report.status.open')
      assert_equal report.reportable_title, meetup.title
    end
  end
end
