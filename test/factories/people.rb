FactoryGirl.define do
  factory :person do
    first_name 'Pizza'
    last_name 'TheHutt'
    dob DateTime.parse('1978-04-07 15:30')
    association :member
    association :chart
    year_branch_id 7
    hour_branch_id 10
    # after_create 
  end
end