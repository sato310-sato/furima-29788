FactoryBot.define do
  factory :user_price do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '000-0000' }
    prefectural_id { 2 }
    city { '江東区' }
    house_number { '南砂町1-1-1' }
    building { '東京ハイツ' }
    phone_number { '1234567891' }
  end
end
