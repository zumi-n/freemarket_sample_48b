FactoryBot.define do
  factory :address do
    user { nil }
    family_name_kanji { "MyString" }
    first_name_kanji { "MyString" }
    family_name_kana { "MyString" }
    first_name_kana { "MyString" }
    birthday { "2019-04-20" }
    postal_code { "MyString" }
    prefecture { "MyString" }
    city { "MyString" }
    street_address { "MyString" }
    building { "MyString" }
  end
end
