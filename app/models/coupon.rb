class Coupon < ActiveRecord::Base
  has_many :users

  validates :discount_percentage, presence: true
  validates :code, presence: true
  validates :code, uniqueness: true
end
