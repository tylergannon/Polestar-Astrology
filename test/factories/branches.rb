# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :branch do
    char "s"
    pinyin "blah"
    animal "horse"
    normalized "nice"
  end
end
