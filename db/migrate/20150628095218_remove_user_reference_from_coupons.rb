class RemoveUserReferenceFromCoupons < ActiveRecord::Migration
  def change
    remove_column :coupons, :user_id
  end
end
