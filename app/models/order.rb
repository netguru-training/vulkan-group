class Order < ActiveRecord::Base
  has_many :products
  belongs_to :user

  validates_presence_of :address, :email

  validates :email, length: { maximum: 50 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
end
