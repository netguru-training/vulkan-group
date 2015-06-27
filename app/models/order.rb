class Order < ActiveRecord::Base
  has_many :products

  validates_presence_of :address, :email
end
