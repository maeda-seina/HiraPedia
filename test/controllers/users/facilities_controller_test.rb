require 'test_helper'

class Users::FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_facilities_index_url
    assert_response :success
  end

  test "should get show" do
    get users_facilities_show_url
    assert_response :success
  end

end
