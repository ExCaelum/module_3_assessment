class Store < OpenStruct
  attr_reader :service

  def self.service
    @service ||= BestbuyService.new
  end

  def self.all(zip)
    service.get_stores(zip)
  end

end
