FactoryGirl.define do
  factory :api_key do
    sequence(:name) {|n| Faker::Name.name}
    sequence(:access_token) {|n| SecureRandom.hex}

    scope 'api'
  end
end