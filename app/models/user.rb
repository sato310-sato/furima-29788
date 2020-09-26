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
  
  validates :password, length: { minimum: 6 }

  @email_regex = (/\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i)
  validates :email , uniqueness: true
  validates :email , format: { with: @email_regular_expressions, message: 'メールアドレスを入力して下さい'} ,allow_nil: true

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

  @zenkaku_regex = (/\A[ぁ-んァ-ン一-龥]+\z/)
  with_options presence: true do
    validates :first_name, format: { with: @zenkaku_regex , message: '全角文字を使用してください' },  allow_nil: true
    validates :last_name, format: { with: @zenkaku_regex , message: '全角文字を使用してください' },  allow_nil: true
    validates :first_name_kana, format: { with: @zenkaku_regex , message: '全角文字を使用してください' },  allow_nil: true
    validates :last_name_kana, format: { with: @zenkaku_regex , message: '全角文字を使用してください' },  allow_nil: true
  end
  
  @PASSWORD_REGEX = (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i).freeze
    validates_format_of :password, with: @PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end

