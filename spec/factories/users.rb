FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1234as' }
    password_confirmation { password }
    last_name_kanji { '山田' }
    first_name_kanji { '太朗' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '1999-02-01' }
  end
end
