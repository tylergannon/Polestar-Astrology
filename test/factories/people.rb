FactoryGirl.define do
  factory :person do
    first_name 'Pizza'
    last_name 'TheHutt'
    dob DateTime.parse('1978-04-07 15:30')
    association :member
  end
end