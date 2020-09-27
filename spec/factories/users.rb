FactoryBot.define do
  factory :user do
    nickname { '辻村mizuki' }
    last_name { '龍之介リュウのすけ' }
    first_name { '芥川あくたガワ' }
    last_name_kana { 'カタカナ' }
    first_name_kana { 'ヒラガナ' }
    birthday { '2014-09-23' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
