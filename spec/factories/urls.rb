FactoryGirl.define do
  factory :url do
    original_url { Faker::Internet.unique.url }
  end
end
