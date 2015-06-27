class AddUserRefToCoupon < ActiveRecord::Migration
  def change
    add_reference :coupons, :user
  end
end
