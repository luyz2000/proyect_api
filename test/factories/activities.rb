FactoryBot.define do
  factory :activity do
    name { Faker::Name.name  }
    description { Faker::Lorem.paragraph }
  end
end
