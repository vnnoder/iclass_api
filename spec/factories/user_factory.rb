FactoryGirl.define do
  factory :user, :class => User do
    name "Vu Minh Tan"
    password "secret"
    password_confirmation "secret"
    username "michael"
    email "i_am_larry_page@gmail.com"
  end
end