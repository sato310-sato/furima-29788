FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    last_name {Faker::Japanese::Name.last_name}
    first_name {Faker::Japanese::Name.first_name}
    last_name_kana {Faker::Japanese::Name.last_kana_name}
    first_name_kana {Faker::Japanese::Name.first_kana_name}
    birthday {Faker::Date.birthday}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end