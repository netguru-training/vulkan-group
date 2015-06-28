  class CartsController < ApplicationController
  before_action :authenticate_user!
  expose(:cart) { current_cart }
  expose(:products) { current_cart.products.order(:id) }
  expose(:user) { current_user }

  def show
  end

  def add_to_cart
    current_cart.add_product(params[:product_id])
    redirect_to cart_path
  end

  def decrement_from_cart
    current_cart.decrement_product(params[:product_id])
    redirect_to cart_path
  end

  def delete_from_cart
    current_cart.delete_product(params[:product_id])
    redirect_to cart_path
  end

  private

    def current_cart
      Cart.find_or_create_by(user_id: current_user.id)
    end
end
