FactoryGirl.define do
  factory :event_request do
    owner { create(:owner) }
    repo { create(:repo) }
    event_type { create(:event_type) }
  end

  factory :event_type do
    sequence(:name) { |n| "event_type#{n}" }
  end

  factory :owner do
    sequence(:name) { |n| "owner#{n}" }
  end

  factory :repo do
    sequence(:name) { |n| "owner#{n}" }
  end
end
