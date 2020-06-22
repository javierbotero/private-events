require 'test_helper'

class CreateEventTest < ActionDispatch::IntegrationTest
  test 'get new event form and should create event with attandees' do
    user = User.create(username: 'Bekhzod')
    sign_in_as(user)
    get '/events/new'
    assert_response :success
    assert_difference 'Event.count' do
      post events_url, params: { event:
        { title: 'New Year', date: '20/06/2020', description: 'This is descripotion' },
                                 attendees: [1, 2, 3] }
      assert_response :redirect
    end
    assert_redirected_to event_url(Event.last)
    follow_redirect!
    assert_match 'Year', response.body
  end
end
