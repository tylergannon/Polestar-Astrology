require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  sign_in_member
  
  test "get new" do
    get :new
    assert_response :success
    assert_template :new
  end
end
