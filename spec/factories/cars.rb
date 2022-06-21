FactoryBot.define do
  factory :car do
    title { "BWM" }
    description { "Lorem ispsum" }
    model { "CR4" }
    price { 2000 }
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/image.png')), 'image/png') }

    association :user, factory: :user

  end
end
