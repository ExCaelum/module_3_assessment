class Store
  attr_reader :service

  def self.service
    @service ||= BestbuyService.new
  end

  def self.all
    stores = service.get_stores
  end

end
