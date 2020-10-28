require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get products_Index_url
    assert_response :success
  end

end
