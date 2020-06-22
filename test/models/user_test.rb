require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user should be valid' do
    @user = User.new(username: 'Bekhzod')
    assert @user.valid?
  end
end
