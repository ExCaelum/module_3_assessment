require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "we receive an index of items returned as json" do
    get "api/v1/items"
    assert_response :success
    items = JSON.parse(response.body)
    assert_equal 2, items.count
    assert_equal "Hammer" || "wrench", items.first["name"]
    assert_equal "A very good hammer" || "A very good wrench", items.first["description"]
    assert_equal "www.hammer.com" || "www.wrench.com", items.first["image_url"]
    assert_equal nil, items.last["created_at"]
  end

  test "we receive one item" do
    get "api/v1/items/1"
    assert_response :success
    item = JSON.parse(response.body)
    assert_equal "Hammer", item["name"]
    assert_equal "A very good hammer", item["description"]
    assert_equal "www.hammer.com", item["image_url"]
    assert_equal nil, item["created_at"]
  end

  test "we can delete an item" do
    delete "api/v1/items/1"
    assert_response :success

    assert_equal nil, response.body
    assert_equal 1, Item.all.count
  end
end
