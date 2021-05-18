# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#followed_by?' do
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice.followed_by?(bob)
  end
end
