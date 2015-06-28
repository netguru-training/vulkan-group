class OrdersController < ApplicationController
  before_action :authenticate_user!

  expose(:order, attributes: :order_params)
  expose(:cart)

  def new
    cart = Cart.find_by(user_id: current_user.id)
    if cart.products.empty?
      redirect_to root_url, notice: "Your cart is empty" and return
    end
  end

  def show
  end

  def create
    order = Order.new(order_params)
    order.user_id = current_user.id

    if order.save
      redirect_to root_url, notice: 'Thank you for your order.'
    else
      render :new
    end
  end

  def destroy
    order.destroy
  end

  private

    def order_params
      params.require(:order).permit(:address, :email)
    end

end
