class Store < OpenStruct
  attr_reader :service

  def self.service
    @service ||= BestbuyService.new
  end

  def self.all(zip)
    stores = service.get_stores(zip)
    stores["stores"].map do |store_hash|
      Store.new(store_hash)
    end
  end

  def self.total(zip)
    service.get_stores(zip)["total"]
  end

  def self.find(id)
    Store.new(service.find_store(id)["stores"].first)
  end

end
