FactoryBot.define do
  factory :user do
    email      { Faker::Internet.email }
    password   { Faker::Internet.password }
    created_at { "2019-04-25 08:27:28" }
    updated_at { "2019-04-25 08:27:28" }
  end
end
