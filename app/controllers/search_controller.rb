class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @products = []
    else
      @products = Product.__elasticsearch__.search params[:q]
    end
  end
end
