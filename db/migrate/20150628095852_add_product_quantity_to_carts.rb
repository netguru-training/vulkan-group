class AddProductQuantityToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :product_quantity, :text
  end
end
