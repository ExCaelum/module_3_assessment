require 'test_helper'

class StoreNameIsLinkToStorePageTest < ActionDispatch::IntegrationTest
  test "when clicking on the link that I get from the stores, I should see the hours" do
    get "/stores/2740"
    assert_respone :success

    assert page.has_content?("Store name: Best Buy Mobile - Cherry Creek Shopping Center")
    assert page.has_content?("Store type: Mobile")


  end
end
