require 'test_helper'

class User::AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_answers_new_url
    assert_response :success
  end

end
