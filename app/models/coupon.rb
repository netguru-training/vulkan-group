class Coupon < ActiveRecord::Base
  validates :discount_percentage, presence: true
  validates :code, presence: true
  validates :code, uniqueness: true
end
