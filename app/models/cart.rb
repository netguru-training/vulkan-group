class Cart < ActiveRecord::Base
  has_many :products
  belongs_to :user
  belongs_to :order
  serialize :product_quantity

  def add_product(product_id)
    product = Product.find(product_id)
    products << product

    self.product_quantity ||= Hash.new(0)
    if self.product_quantity[product_id].nil?
      self.product_quantity[product_id] = 1
    else
      self.product_quantity[product_id] += 1
    end
    product.stock -= 1
    product.save
    save
  end

  def cart_price
    cart_sum = 0
    products.each do |product|
      cart_sum += total_price(product.id)
    end
    cart_sum
  end

  def get_qty(product_id)
    product_quantity[product_id.to_s]
  end

  def total_price(product_id)
    product_quantity[product_id.to_s] * products.find(product_id).price
  end

end
