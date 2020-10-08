class UserPrice
  include ActiveModel::Model
  # クラス外部からインスタンス変数の参照や更新ができる
  attr_accessor :token, :postal_code, :prefectural_id, :city, :house_number, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :city
    validates :house_number
    validates :prefectural_id
    validates :postal_code
    validates :phone_number
    validates :token
  end

  @postal_code = /\A[0-9]{3}-[0-9]{4}\z/
  validates_format_of :postal_code, with: @postal_code

  @phone_number = /\A\d{10,11}\z/
  validates_format_of :phone_number, with: @phone_number

  validates :phone_number, length: { maximum: 11 }

  validates :prefectural_id, numericality: { other_than: 1 }

  def save
    order = Order.create!(item_id: item_id, user_id: user_id)
    Address.create!(postal_code: postal_code, prefectural_id: prefectural_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
