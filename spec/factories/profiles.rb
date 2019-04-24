FactoryBot.define do
  factory :profile do
    user         { Faker::Name.name }
    introduction { "MyText" }
    image        { "MyString" }
    nickname     { "MyString" }
  end
end
