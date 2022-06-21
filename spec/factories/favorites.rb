FactoryBot.define do
  factory :favorite do
    favorite { false }
    association :user, factory: :user
    association :car, factory: :car
    
  end
end
