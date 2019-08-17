require 'test_helper'

class Admin::GosyuinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gosyuins_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_gosyuins_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_gosyuins_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_gosyuins_edit_url
    assert_response :success
  end

end
