require 'test_helper'

class Users::InquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_inquiry_index_url
    assert_response :success
  end

  test "should get confirm" do
    get users_inquiry_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get users_inquiry_thanks_url
    assert_response :success
  end

end
