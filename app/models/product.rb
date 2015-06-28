require 'elasticsearch/model'

class Product < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :cart
  validates_presence_of :name, :description, :price, :stock, :category_id

  validates_numericality_of :price, greater_than_or_equal_to: 0.01
  validates_numericality_of :stock,
                            only_integer: true,
                            greater_than_or_equal_to: 0

  validates_format_of :price, with: /\A\d+(?:\.\d{0,2})?\z/

  validate :image_size

  def available?
    stock > 0
  end

  class << self
    delegate :search, to: :__elasticsearch__ unless respond_to?(:search)
  end

  def self.search(search_term)
    __elasticsearch__.search(
    {
      query: {
        filtered: {
            filter: {
                bool: {
                    should: [
                        {
                            query: {
                                wildcard: {
                                    "name": "*" + search_term + "*"
                                }
                            }
                        }
                    ]
                }
            }
        }
      }
    }
  )
  end

  private

    def self.random_products
      where.not('image' => nil).order("RANDOM()")
    end

    def image_size
      upload_limit = 1
      msg = "You cannot upload a file greater than #{upload_limit}MB"
      errors.add(:image, msg) if image.size > upload_limit.megabyte
    end
end
Product.import
