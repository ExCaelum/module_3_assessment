require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "we receive an index of items returned as json" do
    get "api/v1/items"
    assert_response :success
    items = JSON.parse(response.body)
    assert_equal 2, items.count
    assert_equal "Hammer", items.last["name"]
  end
end
