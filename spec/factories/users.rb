FactoryBot.define do
  factory :user do
    # id { 1 }
    name { "Victor" }
    email { "barhvictor@gmail.com" }
    password { "railsrails" }
    password_confirmation { "railsrails" }
  end
end
