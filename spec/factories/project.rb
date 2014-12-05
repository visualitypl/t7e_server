FactoryGirl.define do
  factory :project do
    sequence(:name) {|n| Faker::Name.title}
    sequence(:description) {|n| Faker::Lorem.paragraph}
    default_language 'pl'
  end
end