require 'test_helper'

class Users::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_post_index_url
    assert_response :success
  end

  test "should get show" do
    get users_post_show_url
    assert_response :success
  end

  test "should get create" do
    get users_post_create_url
    assert_response :success
  end

  test "should get update" do
    get users_post_update_url
    assert_response :success
  end

  test "should get edit" do
    get users_post_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get users_post_destroy_url
    assert_response :success
  end

end
