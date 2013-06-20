FactoryGirl.define do
  factory :user, :class => User do
    password "secret"
    password_confirmation "secret"
    username { Faker::Name.first_name }
  end
end