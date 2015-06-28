require 'rails_helper'

describe CartsController do

  let(:valid_session) { {} }

  let(:user) { User.create(email: 'admin@example.com', password: 'password') }

  describe 'GET #show' do
    context 'when user is logged in' do

      before do
        sign_in user
        controller.stub(:user_signed_in?).and_return(true)
        controller.stub(:current_user).and_return(user)
        controller.stub(:authenticate_user!).and_return(user)
      end


      it 'exposes the requested cart' do
        cart = Cart.create(user_id: user.id)
        get :show, valid_session
        expect(controller.cart).to eq(cart)
      end
    end

    context 'when user is logged out' do
       it 'redirects user to the login page' do
        get :show
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
