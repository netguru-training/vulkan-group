class Cart < ActiveRecord::Base
  has_many :products
  belongs_to :user
  belongs_to :order

  def add_product(product_id)
    product = Product.find(product_id)
    products << product
    product.stock -= 1
    product.save
    save
  end

  def cart_price
    products.sum(:price)
  end
end
