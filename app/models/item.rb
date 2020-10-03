class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_free
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :estimated_delivery
  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    validates :category_id
    validates :item_text
    validates :delivery_free_id
    validates :product_condition_id
    validates :delivery_source_id
    validates :estimated_delivery_id
    validates :image
  end

  # validates :price, numericality: { greater_than: 299, less_than: 10000000 }
  # 指定された値より等しいか大きい、小さい
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000 }
  @price_regex = /\A[0-9]+\z/
  validates_format_of :price, with: @price_regex, allow_nil: true 

  validates :category_id, numericality: { other_than: 1 }
  validates :delivery_free_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :delivery_source_id, numericality: { other_than: 1 }
  validates :estimated_delivery_id, numericality: { other_than: 1 }
end
