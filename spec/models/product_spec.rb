require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create(name: "Veggies") }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:stock) }
  it { should validate_presence_of(:category_id) }

  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:stock) }

  it { should belong_to(:category) }
  it { should belong_to(:cart) }

  describe 'price' do
    let(:product) {
      Product.new(
        name: 'Glass',
        description: 'Test description',
        stock: 2,
        category_id: category.id
      )}

    it 'is limited to two decimal places' do
      product.price = 9.999
      expect(product.save).to be_falsey
    end

    it 'is greater than or equal to 0' do
      product.price = 5
      expect(product.save).to be_truthy
    end

    it 'is not lower than 0' do
      product.price = -55
      expect(product.save).to be_falsey
    end
  end

  describe 'stock' do
    let(:product) {
      Product.new(
        name: 'Glass',
        description: 'Test description',
        price: 11.11,
        category_id: category.id
      )}

    it 'is limited to positive integer value' do
      product.stock = -1
      expect(product.save).to be_falsey

      product.stock = 0.0
      expect(product.save).to be_falsey

      product.stock = 1.1
      expect(product.save).to be_falsey

      product.stock = 2
      expect(product.save).to be_truthy
    end
  end
end
