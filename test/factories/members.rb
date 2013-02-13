# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "somebody#{n}@gmail.com"
  end
  
  factory :member do
    email
    password 'zenurewa7rubrA'
    password_confirmation 'zenurewa7rubrA'
  end
end
