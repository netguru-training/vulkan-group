ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock, :cart_id, :image, :categoryu_id
end
