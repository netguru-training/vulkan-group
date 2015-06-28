class AddDefaultValueToStatus < ActiveRecord::Migration
  def change
    change_column_default :orders, :status, default: "new"
  end
end
