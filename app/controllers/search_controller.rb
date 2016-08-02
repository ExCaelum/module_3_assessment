class SearchController < ApplicationController

  def index
    @stores = Store.all(params[:q])
    byebug
  end

end
