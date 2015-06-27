class RemoveDefaultValueFromAddress < ActiveRecord::Migration
  def change
    change_column_default :orders, :address, nil
  end
end
