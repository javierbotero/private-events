require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: 'Bekhzod')
    sign_in_as(@user)
  end

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'should get new' do
    get new_event_path
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count', 1) do
      post events_url, params: { event: { title: 'title', date: '20/06/2020', description: 'This is descripotion' },
                                 attendees: [1, 2, 3] }
    end

    assert_redirected_to event_url(Event.last)
  end

  test 'should show event' do
    event = Event.create(title: 'Title', description: 'This is description', creator_id: 1)
    get event_path(id: event.id)
    assert_response :success
  end
end
