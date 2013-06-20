# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :option do
    content "A choice"
    association(:survey, :factory => :multiple_choices_survey)
  end
end
