# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test 'two events cannot have the same date' do
    now = Time.now

    event = Event.new(date: now)
    assert_nothing_raised do
      event.save!
    end

    event1 = Event.new(date: now)
    event.save!
    assert_not_nil event.errors

    puts 'Test: Event -> Imposible to have two events with the same date'
  end
end
