class StaticPagesController < ApplicationController
  expose(:products) { Product.random_products.first(3) }
  expose(:discounted_products) { Product.random_products.last(3) }

  def index
  end
end
