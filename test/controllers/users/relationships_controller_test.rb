# frozen_string_literal: true

require 'test_helper'

module Users
  class RelationshipsControllerTest < ActionDispatch::IntegrationTest
    test 'should get create' do
      get users_relationships_create_url
      assert_response :success
    end

    test 'should get destroy' do
      get users_relationships_destroy_url
      assert_response :success
    end
  end
end
