FactoryBot.define do
  factory :card do
    user { nil }
    token { 1 }
    expiration_year { 1 }
    expiration_month { 1 }
    security_code { 1 }
  end
end
