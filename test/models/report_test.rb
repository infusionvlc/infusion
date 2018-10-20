# frozen_string_literal: true

# ~/test/models/report_test.rb
require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'Valid Report with type hate' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 0,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_equal report.valid?, true, 'Proposal is invalid with all info'
    assert_equal report.text_type, 'Incitación al odio'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
    puts 'Test: Report -> Valid Report with type hate'
  end

  test 'Valid Report with type menace' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 1,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_equal report.valid?, true, 'Proposal is invalid with all info'
    assert_equal report.text_type, 'Amenazas o insultos'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
    puts 'Test: Report -> Valid Report with type menace'
  end

  test 'Valid Report with type pornography' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 2,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_equal report.valid?, true, 'Proposal is invalid with all info'
    assert_equal report.text_type, 'Pornografía'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
    puts 'Test: Report -> Valid Report with type pornography'
  end

  test 'Valid Report with type community' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 3,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_equal report.valid?, true, 'Proposal is invalid with all info'
    assert_equal report.text_type, 'No respeta las normas de la comunidad'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
    puts 'Test: Report -> Valid Report with type community'
  end

  test 'Valid Report with type other' do
    user = users(:one)
    meetup = meetups(:one)
    report = Report.new(title: 'TestTitle',
                        type_of: 4,
                        reportable_type: 'Meetup',
                        user_id: user.id,
                        reportable_id: meetup.id,
                        description: 'TestDescritpion')
    assert_equal report.valid?, true, 'Proposal is invalid with all info'
    assert_equal report.text_type, 'Otro'
    assert_equal report.text_status, 'Abierta'
    assert_equal report.reportable_title, meetup.title
    puts 'Test: Report -> Valid Report with type other'
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
end
