require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get things" do
    get :things
    assert_response :success
  end

end
