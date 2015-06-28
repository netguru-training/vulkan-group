class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  expose(:cart) { current_cart }

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def find_categories
    @categories = Category.all
  end


  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  helper_method :find_categories

  private

    def current_cart
      Cart.find_or_create_by(user_id: current_user.id)
    end
end
