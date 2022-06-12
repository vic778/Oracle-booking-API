FactoryBot.define do
  factory :car do
    title { "MyString" }
    description { "MyText" }
    model { "MyString" }
    price { 1.5 }
    image { "MyString" }
    user { nil }
  end
end
