class Store < OpenStruct
  attr_reader :service

  def self.service
    @service ||= BestbuyService.new
  end

  def self.all(zip)
    service.get_stores(zip)
  end

  def self.find(id)
    json_hash = service.find_store(id)
    json_hash["stores"].first
  end

end
