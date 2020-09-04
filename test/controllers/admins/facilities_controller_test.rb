require 'test_helper'

class Admins::FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_facilities_create_url
    assert_response :success
  end

  test "should get index" do
    get admins_facilities_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_facilities_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_facilities_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_facilities_update_url
    assert_response :success
  end

end
