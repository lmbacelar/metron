FactoryGirl.define do
  factory :instrument do
    sequence(:reference) { |n| "INST#{n}" }
    description "Equipment's description"
  end
end
