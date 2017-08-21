FactoryGirl.define do
  factory :event_request do
    owner_id 1
    repo_id 1
    event_type_id 1
  end
  factory :event_type do
    name "MyString"
  end
  factory :owner do
    sequence(:name) { |n| "owner#{n}" }
  end

  factory :repo do
    sequence(:name) { |n| "owner#{n}" }
  end
end
