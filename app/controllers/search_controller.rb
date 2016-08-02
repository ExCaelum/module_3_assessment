class SearchController < ApplicationController

  def index
    Store.all
  end

end
