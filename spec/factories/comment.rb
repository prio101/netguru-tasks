FactoryBot.define do
  factory :comment do |f|
      f.comment { Faker::Lorem.sentence }
      movie
      user
  end
end
