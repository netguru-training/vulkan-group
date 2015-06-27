class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin_user!

  def index
    @coupons = Coupon.all
    respond_with(@coupons)
  end

  def show
    respond_with(@coupon)
  end

  def new
    @coupon = Coupon.new
    respond_with(@coupon)
  end

  def edit
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to @coupon, notice: 'Coupon was successfully created.'
    else
      render action: 'new', alert: 'Error during coupon creation.'
    end
  end

  def update
    @coupon = Coupon.find(params[:id])
    @coupon.attributes = coupon_params
    if @coupon.save
      redirect_to @coupon, notice: 'Coupon was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @coupon.destroy
    redirect_to @coupon, notice: 'Coupon was successfully destroyed.'
  end

  private

    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    def coupon_params
      params.require(:coupon).permit(:code, :discount_percentage, :user_id)
    end

end
