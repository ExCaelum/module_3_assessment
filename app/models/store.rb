class Store < OpenStruct
  attr_reader :service

  def self.service
    @service ||= BestbuyService.new
  end

  def self.all(zip)
    stores = service.get_stores(zip)
  end

end
