require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "event shoud not be valid without Creator" do
    @event = Event.new()
    assert_not @event.valid?
  end
end
