# frozen_string_literal: true

require 'test_helper'

module Users
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get users_users_url
      assert_response :success
    end

    test 'should get show' do
      get users_user_url(1)
      assert_response :success
    end

    test 'should get edit' do
      get edit_users_user_url(1)
      assert_response :success
    end
  end
end
