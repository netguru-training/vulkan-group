  class CartsController < ApplicationController
  before_action :authenticate_user!
  expose(:cart) { current_cart }
  expose(:products) { current_cart.products.order(:id) }
  expose(:user) { current_user }

  def show
  end

  def add_to_cart
    current_cart.add_product(params[:product_id])
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { render json: current_cart.get_qty(params[:product_id]) }
    end
  end

  def decrement_from_cart
    current_cart.decrement_product(params[:product_id])
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { render json: current_cart.get_qty(params[:product_id]) }
    end
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
