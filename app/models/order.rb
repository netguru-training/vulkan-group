class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carts

  validates_presence_of :address, :email

  validates :email,
            length: { maximum: 50, allow_nil: false },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i },
            uniqueness: { case_sensitive: false }

  def total_price
    products.sum(:price) if self.products.count > 0
  end

  def total_discount(discount_percentage)
    total_price * (discount_percentage / 100) unless total_price.nil?
  end
end
