class RemoveDefaultValueFromUserEmail < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, default: false
  end
end
