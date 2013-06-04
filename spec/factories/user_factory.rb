FactoryGirl.define do
  factory :user, :class => User do
    password "secret"
    password_confirmation "secret"
    username "michael"
  end
end