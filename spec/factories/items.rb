FactoryBot.define do
  factory :item do
    user
    category
    user_id { 1 }
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    brand { "MyString" }
    size { "MyString" }
    condition { "MyString" }
    price { Faker::Commerce.price }
    profit { "MyString" }
    category_id_id { 1 }
  end
end