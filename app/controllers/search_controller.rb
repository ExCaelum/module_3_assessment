class SearchController < ApplicationController

  def index
    @total = Store.total(params[:q])
    # @stores = Store.all(params[:q])["stores"]
    @stores = Store.all(params[:q])
  end

end
