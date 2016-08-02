require 'test_helper'

class StoreNameIsLinkToStorePageTest < ActionDispatch::IntegrationTest
  test "when visitin a store show page, I should see the stores information" do
    get "/stores/2740"
save_and_open_page
    assert page.has_content?("Best Buy Mobile - Cherry Creek Shopping Center")
    # assert page.has_content?("Store Type: Mobile")
    # assert page.has_content?("3000 East First Ave - Denver, CO 80206")
  end
end
