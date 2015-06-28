ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end

        panel "Recent products" do
          Product.last(5).map do |product|
            li link_to(product.name, admin_product_path(product))
          end
        end
      end
    end
  end
end
