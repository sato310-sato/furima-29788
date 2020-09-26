FactoryBot.define do
  factory :user do
    nickname {"yaegashi"}
    last_name {"handa"}
    first_name {"neko"}
    last_name_kana {"takada"}
    first_name_kana {"abe"}
    barth_day {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
    email {Faker::Internet.free_email}
    # email                 {"test@gmail.com"}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
   end
end