class AddOrderReferenceToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :order
  end
end
