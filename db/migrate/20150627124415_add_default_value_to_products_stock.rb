class AddDefaultValueToProductsStock < ActiveRecord::Migration
  def change
    change_column_default :products, :stock, default: 0
  end
end
