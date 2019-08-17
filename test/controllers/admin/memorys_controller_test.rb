require 'test_helper'

class Admin::MemorysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_memorys_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_memorys_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_memorys_edit_url
    assert_response :success
  end

end
