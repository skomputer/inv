require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "should get things" do
    get :things
    assert_response :success
  end

  test "should get accounts" do
    get :accounts
    assert_response :success
  end

end
