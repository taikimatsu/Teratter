require 'test_helper'

class Admin::UrControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_ur_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_ur_edit_url
    assert_response :success
  end

end
