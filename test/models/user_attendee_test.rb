require 'test_helper'

class UserAttendeeTest < ActiveSupport::TestCase
  test 'user_attenees should be valid' do
    @user_attenees = UserAttendee.new(attendee_id: 1, attended_event_id: 1)
    assert_not @user_attenees.valid?
  end
end
