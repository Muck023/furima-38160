FactoryBot.define do
  factory :order_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    postcode       { '123-1234' }
    region_id      { Faker::Number.between(from: 2, to: 48) }
    city           { Gimei.city.kanji }
    block          { '１' + Gimei.town.kanji }
    building       { Gimei.town.to_s + Gimei.town.katakana + '１' }
    phone_number   { Faker::Number.number(digits: 11) }

    association :user
    association :item
  end
end
