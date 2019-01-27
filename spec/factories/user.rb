FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    phone_number '01712187374'
    password 'password'
  end
end
