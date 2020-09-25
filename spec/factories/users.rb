FactoryBot.define do
  factory :user do
    nickname {Faker::Name.nickname}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_name {Faker::Name.first_name}
    last_name_kana_name {Faker::Name.last_name_kana}
    first_name_kananame {Faker::Name.first_name_kana}
    birthday {Faker::Date.birthday}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end