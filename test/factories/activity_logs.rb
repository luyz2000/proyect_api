FactoryBot.define do
  factory :activity_log do
    baby 
    assistant 
    activity 
    start_time { "2017-04-03T21:21:09Z" }
    stop_time { "2017-04-03T21:49:09Z" }
    duration { "10 minutes" }
    name { Faker::Name.name }
    comments { Faker::Lorem.paragraph }
  end
end
