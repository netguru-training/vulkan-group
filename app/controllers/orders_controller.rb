class OrdersController < ApplicationController
  before_action :authenticate_user!

  expose(:order, attributes: :order_params)
  expose(:cart) { Cart.find_by(user_id: current_user.id) }

  def new
    if cart.products.empty?
      redirect_to root_url, notice: "Your cart is empty" and return
    end
  end

  def show
  end

  def create
    order = Order.new(order_params)
    order.user_id = current_user.id
    order.price = cart.cart_price

    if order.save
      cart.order_id = order.id
      cart.save
      cart.destroy
      redirect_to new_order_transaction_url(order.id), notice: 'Thank you for your order.'
    else
      render :new
    end
  end

  def destroy
    order.destroy
    redirect_to root_url, notice: 'Your order has been cancelled.'
  end

  private

    def order_params
      params.require(:order).permit(:address, :email)
    end

end
