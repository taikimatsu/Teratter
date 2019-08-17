require 'test_helper'

class User::TemplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_temples_index_url
    assert_response :success
  end

  test "should get show" do
    get user_temples_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_temples_edit_url
    assert_response :success
  end

end
