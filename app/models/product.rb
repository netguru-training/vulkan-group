class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :cart
  validates_presence_of :name, :description, :price, :stock

  validates_numericality_of :price, greater_than_or_equal_to: 0.01
  validates_numericality_of :stock,
                            only_integer: true,
                            greater_than_or_equal_to: 0

  validates_format_of :price, with: /\A\d+(?:\.\d{0,2})?\z/

  validate :image_size

  private

    def image_size
      upload_limit = 1
      msg = "You cannot upload a file greater than #{upload_limit}MB"
      errors.add(:image, msg) if image.size > upload_limit.megabyte
    end
end
