FactoryBot.define do
  factory :entity do
    name { Faker::Company.name }
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    user
  end
end
