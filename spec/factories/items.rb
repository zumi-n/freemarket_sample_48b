FactoryBot.define do
  factory :item do
    user
    name { "MyString" }
    description { "MyText" }
    brand { "MyString" }
    size { "MyString" }
    condition { "MyString" }
    price { "MyString" }
    profit { "MyString" }
  end
end