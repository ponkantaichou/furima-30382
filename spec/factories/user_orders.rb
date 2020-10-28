FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '551-5551' }
    prefectures_id { 2 }
    municipality { '11' }
    address { '11' }
    building_name { '青山11' }
    phone_number { '09011111111' }
  end
end
