class UsersController < ApplicationController
  expose(:user)
  expose(:products) { user.products }

  def show
  end
end
