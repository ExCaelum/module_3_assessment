class Store < OpenStruct
  attr_reader :service

  def self.service
    @service ||= BestbuyService.new
  end

  def self.all(zip)
    service.get_stores(zip)
  end

  def self.find(id)
    service.find_store(id)
  end

end
