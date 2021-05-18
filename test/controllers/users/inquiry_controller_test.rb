# frozen_string_literal: true

require 'test_helper'

module Users
  class InquiryControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get users_inquiry_index_url
      assert_response :success
    end

    test 'should get confirm' do
      get users_inquiry_confirm_url
      assert_response :success
    end

    test 'should get thanks' do
      get users_inquiry_thanks_url
      assert_response :success
    end
  end
end
