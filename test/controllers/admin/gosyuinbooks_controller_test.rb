require 'test_helper'

class Admin::GosyuinbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gosyuinbooks_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_gosyuinbooks_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_gosyuinbooks_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_gosyuinbooks_edit_url
    assert_response :success
  end

end
