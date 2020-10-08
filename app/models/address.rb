class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefectural
  belongs_to :order

  with_options presence: true do
    validates :city
    validates :house_number
    validates :prefectural_id
  end

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  validates :prefectural_id, numericality: { other_than: 1 }
end
