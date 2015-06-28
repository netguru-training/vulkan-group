module ProductsHelper
  def total_price(product, cart)
    product.price * cart.product_quantity[product.id.to_s]
  end
end
