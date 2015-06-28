ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock, :cart_id, :image, :category_id


end
