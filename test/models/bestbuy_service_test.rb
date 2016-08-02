require 'test_helper'

class BestbuyServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = BestbuyService.new
  end

  test "#stores" do
   VCR.use_cassette("bestbuy_service#stores") do
      stores = service.get_stores("80202")
      store = stores["stores"].first

      assert_equal 17, stores["total"]
      assert_equal 15, stores["stores"].count
      assert_equal "Best Buy Mobile - Cherry Creek Shopping Center", store["longName"]
      assert_equal "Denver", store["city"]
      assert_equal "303-270-9189", store["phone"]
      assert_equal 3.25, store["distance"]
      assert_equal "Mobile", store["storeType"]
    end
  end
end
