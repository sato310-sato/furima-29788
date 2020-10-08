class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  @password_regex = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,100}+\z/i
  validates :password, presence: true
  validates_format_of :password, with: @password_regex
  validates_length_of :password, minimum: 6

  @email_regex = /\A\S+@\S+\.\S+\z/
  validates :email, uniqueness: true
  validates_format_of :email, with: @email_regular_expressions, allow_nil: true

  @zenkaku_regex = /\A[ぁ-んァ-ン一-龥]/
  with_options presence: true, format: { with: @zenkaku_regex } do
    validates :first_name
    validates :last_name
  end

  @kana_regex = /\A[ァ-ヶー－]+\z/
  with_options presence: true, format: { with: @kana_regex } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
