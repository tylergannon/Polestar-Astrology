require 'test_helper'

class PillarsControllerTest < ActionController::TestCase  
  sign_in_member
  setup do
    @pillar = create :pillar
  end

  test "should show palace" do
    get :show, id: @pillar.id
    assert_response :success
  end
end
