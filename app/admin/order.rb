ActiveAdmin.register Order do
  permit_params :address, :email, :user_id
end
