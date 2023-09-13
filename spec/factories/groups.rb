FactoryBot.define do
  factory :group do
    name { Faker::Team.name }
    user
  end
end
