class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :orders
 
  with_options presence: true do
   # ニックネームが必須
   validates :nickname
   # 誕生日が必須
   validates :birthday
  end
  
  # パスワードが必須、６文字以上
  validates :password, length: { minimum: 6 }

  # emeailが必須、大文字小文字を区別しない一意、＠含む
  validates :email , uniqueness: true
  validates :email , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i, message: 'メールアドレスを入力して下さい'} ,allow_nil: true

  # 全角ひらがな、カタカナ、漢字入力
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' },  allow_nil: true
  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' },  allow_nil: true
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' },  allow_nil: true
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' },  allow_nil: true
  
  # パスワードは半角英数字と両方含む
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end

