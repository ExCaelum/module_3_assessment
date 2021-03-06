class BestbuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/")
    connection.params["apiKey"] = ENV["BEST_BUY_KEY"]
  end

  def get_stores(zip)
    response = connection.get("stores%28area%28#{zip},25%29%29?format=json&show=storeId,longName,city,distance,phone,storeType&pageSize=15")
    parse(response)
  end

  def find_store(id)
    response = connection.get("stores%28storeId=#{id}%29?format=json&show=longName,storeType,address,city,region,postalCode,hoursAmPm")
    parse(response)
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end

end
