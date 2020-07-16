FactoryBot.define do
  factory :baby do
    name { Faker::Name.name }
    birthday { "2020-07-15" }
    mother_name { Faker::Name.name}
    father_name { Faker::Name.name}
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone_in_e164}
  end
end
