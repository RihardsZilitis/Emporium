require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get place_order" do
    get :place_order
    assert_response :success
  end

  test "should get thanl_you" do
    get :thanl_you
    assert_response :success
  end

end
