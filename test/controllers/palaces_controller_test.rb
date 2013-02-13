require 'test_helper'

class PalacesControllerTest < ActionController::TestCase
  sign_in_member
  
  setup do
    @palace = create(:palace)
  end

  test "should show palace" do
    get :show, id: @palace.slug
    assert_response :success
  end
end
