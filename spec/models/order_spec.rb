require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:email) }
  it { should have_one(:cart) }

  describe 'email validations' do
    subject { Order.create(email: 'goodemail@example.com', address: 'address') }
    it { should ensure_length_of(:email).is_at_most(50) }

    context 'email format' do
      let(:valid_email) { 'goodemail@example.com' }
      let(:invalid_email) { 'bad_email' }

      it 'allows valid email' do
        expect{ Order.create(email: valid_email, address: 'test') }.to_not raise_error
      end

      it 'raises error on invalid email save' do
        expect{ Order.create!(email: invalid_email, address: 'test') }.to raise_error
      end
    end
  end


end
