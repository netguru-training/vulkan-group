class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount_percentage

      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
