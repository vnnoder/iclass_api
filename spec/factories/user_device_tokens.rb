# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_device_token do
    user ""
    device_token "MyString"
  end
end
