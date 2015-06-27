class AddCartReferenceToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :cart
  end
end
