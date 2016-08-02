class SearchController < ApplicationController

  def index
    @json_hash = Store.all(params[:q])
    @stores = Store.all(params[:q])["stores"]
  end

end
