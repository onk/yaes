# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    name "MyString"
    job nil
    strength 1
    dexterity 1
    magic 1
    agility 1
    vitality 1
  end
end
