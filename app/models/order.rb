class Order < ActiveRecord::Base
  belongs_to :user
  has_one :cart

  validates_presence_of :address, :email

  validates :email,
            length: { maximum: 50, allow_nil: false },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i }

  def total_price
    products.sum(:price) if self.products.count > 0
  end

  def total_discount(discount_percentage)
    total_price * (discount_percentage / 100) unless total_price.nil?
  end

  def change_status(status)
    self.status = status
    save
  end
end
