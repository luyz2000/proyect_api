FactoryBot.define do
  factory :assistant do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    phone { Faker::PhoneNumber.cell_phone_in_e164}
    group { Faker::Book.title} 
  end
end
