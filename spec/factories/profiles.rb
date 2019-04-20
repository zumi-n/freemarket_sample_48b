FactoryBot.define do
  factory :profile do
    user { nil }
    introduction { "MyText" }
    image { "MyString" }
    nickname { "MyString" }
  end
end
