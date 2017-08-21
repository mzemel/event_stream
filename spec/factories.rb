FactoryGirl.define do
  factory :owner do
    sequence(:name) { |n| "owner#{n}" }
  end

  factory :repo do
    sequence(:name) { |n| "owner#{n}" }
  end
end
