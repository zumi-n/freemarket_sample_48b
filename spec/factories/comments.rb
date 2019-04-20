FactoryBot.define do
  factory :comment do
    user { nil }
    item { nil }
    comment { "MyText" }
  end
end
