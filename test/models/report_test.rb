# frozen_string_literal: true

# ~/test/models/report_test.rb
require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'Valid Report with type hate' do
    test_report_type(0)
  end

  test 'Valid Report with type menace' do
    test_report_type(1)
  end

  test 'Valid Report with type pornography' do
    test_report_type(2)
  end

  test 'Valid Report with type community' do
    test_report_type(3)
  end

  test 'Valid Report with type other' do
    test_report_type(4)
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

  private

  def test_report_type(report_type)
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: report_type,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    if report_type == 0
      assert_equal report.valid?, true, 'Proposal is invalid with all info'
      assert_equal report.text_type, 'Incitación al odio'
      assert_equal report.text_status, 'Abierta'
      assert_equal report.reportable_title, meetup.title
      puts 'Test: Report -> Valid Report with type hate'
    elsif report_type == 1
      assert_equal report.valid?, true, 'Proposal is invalid with all info'
      assert_equal report.text_type, 'Amenazas o insultos'
      assert_equal report.text_status, 'Abierta'
      assert_equal report.reportable_title, meetup.title
      puts 'Test: Report -> Valid Report with type menace'
    elsif report_type == 2
      assert_equal report.valid?, true, 'Proposal is invalid with all info'
      assert_equal report.text_type, 'Pornografía'
      assert_equal report.text_status, 'Abierta'
      assert_equal report.reportable_title, meetup.title
      puts 'Test: Report -> Valid Report with type pornography'
    elsif report_type == 3
      assert_equal report.valid?, true, 'Proposal is invalid with all info'
      assert_equal report.text_type, 'No respeta las normas de la comunidad'
      assert_equal report.text_status, 'Abierta'
      assert_equal report.reportable_title, meetup.title
      puts 'Test: Report -> Valid Report with type community'
    elsif report_type == 4
      assert_equal report.valid?, true, 'Proposal is invalid with all info'
      assert_equal report.text_type, 'Otro'
      assert_equal report.text_status, 'Abierta'
      assert_equal report.reportable_title, meetup.title
      puts 'Test: Report -> Valid Report with type other'
    else
    end
  end
end
