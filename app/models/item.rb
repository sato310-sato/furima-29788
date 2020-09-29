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

  with_options presence: true do
    validates :name
    validates :category
    validates :price
    validates :item_text
    validates :delivery_free
    validates :product_condition
    validates :delivery_source
    validates :estimated_delivery
    validates :user
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :delivery_free_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :delivery_source_id, numericality: { other_than: 1 }
  validates :estimated_delivery_id, numericality: { other_than: 1 }
end
