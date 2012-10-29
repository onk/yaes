# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    category 1
    title "MyString"
    body "MyText"
    published_at "2012-10-30 01:18:22"
    published false
  end

  factory :published_topic, parent: :topic do
    published_at 1.hour.ago
    published true
  end
end
