class Store
  attr_reader :service

  def self.service
    @service ||= BestbuyService.new
  end

  def self.all


end
