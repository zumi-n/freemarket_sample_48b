FactoryBot.define do
  factory :item do
    user { nil }
    name { "MyString" }
    description { "MyText" }
    brand { "MyString" }
    size { "MyString" }
    condition { "MyString" }
    price { "MyString" }
    profit { "MyString" }
  end
end
