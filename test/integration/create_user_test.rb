require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest
  test 'get new user for and create user' do
    get '/users/new'
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_url, params: { user: { username: 'Bekhzod' } }
      assert_response :redirect
    end
    assert_redirected_to user_url(User.last)
    follow_redirect!
    assert_match 'Bekhzod', response.body
  end
end
