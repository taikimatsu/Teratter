require 'test_helper'

class User::MemorysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_memorys_new_url
    assert_response :success
  end

  test "should get show" do
    get user_memorys_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_memorys_edit_url
    assert_response :success
  end

end
