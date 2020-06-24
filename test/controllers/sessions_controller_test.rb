require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: 'Bekhzod')
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get new' do
    get login_url
    assert_response :success
  end

  test 'should create session' do
    post login_url, params: { session: { username: 'Bekhzod' } }
    assert_redirected_to user_path(@user)
  end

  test 'should destroy session' do
    sign_in_as(@user)
    delete logout_url
    assert_redirected_to root_path
  end
end
