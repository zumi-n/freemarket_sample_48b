FactoryBot.define do
  factory :item do
    user
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    brand { "MyString" }
    size { "MyString" }
    condition { "MyString" }
    price { Faker::Commerce.price }
    profit { "MyString" }
  end
end