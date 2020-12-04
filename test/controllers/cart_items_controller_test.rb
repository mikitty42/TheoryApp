require 'test_helper'

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get cart_items_destroy_url
    assert_response :success
  end

end
