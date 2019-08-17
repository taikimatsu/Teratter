require 'test_helper'

class Admin::TemplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_temples_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_temples_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_temples_edit_url
    assert_response :success
  end

end
