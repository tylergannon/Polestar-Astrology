
FactoryGirl.define do
  factory :pillar do
    association :stem
    association :branch
  end
end