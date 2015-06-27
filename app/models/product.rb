class Product < ActiveRecord::Base
  validates_presence_of :name, :description, :price, :stock

  validates_numericality_of :price, greater_than_or_equal: 0.01
  validates_numericality_of :stock, only_integer: true
end
