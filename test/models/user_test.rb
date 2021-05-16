require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#followed_by?' do
    alice = User.new(email: 'alice@example.com')
    bob = User.new(email: 'bob@example.com')
    assert_not alice.followed_by?(bob)
  end
end
