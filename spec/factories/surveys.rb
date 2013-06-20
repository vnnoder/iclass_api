# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :free_text_survey, :class => Survey do
    survey_type Survey::FREE_TEXT
    question "What do you think about test?"
    association(:talk, :factory => :talk)
  end

  factory :multiple_choices_survey, :class => Survey do
    survey_type Survey::MULTIPLE_CHOICES
    question "What is TDD?"
    association(:talk, :factory => :talk)
    ignore do
      options_count 4
    end

    before(:create) do |survey, evaluator|
      FactoryGirl.create_list(:option, evaluator.options_count, :survey => survey)
    end
  end
end
