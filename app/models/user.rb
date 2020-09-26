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
    # 苗字・名前が必須全角ひらがな、全角カタカナ、漢字
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    # 誕生日が必須
    validates :birty_day
  end
    
 

    with_options presence: true, format: { with: /\A(?=.*?[a-z\d?=@])(?=.*?[\d])[a-z\d]+\z/i, message: 'メールアドレスを入力して下さい' } do
    # emeailが必須、大文字小文字を区別しない一意、＠含む、
    validates :email , uniqueness: true
    # パスワードが必須、６文字以上
    validates :password, length: { minimum: 6 }
    end

  # 全角入力
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
  end

  # パスワードは半角英数字
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end

