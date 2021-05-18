# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test '#favorited_by?' do
    alice_post = posts(:alice_post)
    alice = users(:alice)
    bob = users(:bob)
    assert_not alice_post.favorited_by?(bob)
  end
end
