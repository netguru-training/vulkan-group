class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :cart
  validates_presence_of :name, :description, :price, :stock

  validates_numericality_of :price, greater_than_or_equal_to: 0.01
  validates_numericality_of :stock, only_integer: true,
    greater_than_or_equal_to: 0.01

  validates_format_of :price, with: /\A\d+(?:\.\d{0,2})?\z/
end
