FactoryBot.define do
  factory :user do
    email { Faker::Internet.email}
    username { Faker::Lorem.word}
    image { Faker::Avatar.image }
    bio { Faker::Lorem.paragraph }
    password {Faker::Crypto.md5}
  end
end
