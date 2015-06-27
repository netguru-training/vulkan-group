class AddUserReferenceToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :user
  end
end
