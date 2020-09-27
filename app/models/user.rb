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

  validates :password, presence: true, length: { minimum: 6 }

  @email_regex = /\A\S+@\S+\.\S+\z/
  validates :email, uniqueness: true
  validates :email, format: { with: @email_regular_expressions, message: 'メールアドレスを入力して下さい' }, allow_nil: true

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

  @PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: @PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
