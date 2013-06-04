FactoryGirl.define do
  factory :talk, :class => Talk do
    title "New Talk"
    description "A talk for testing"
    start_time Time.now
    end_time Time.now + 1.hour
    status 'new'
    association(:user, :factory => :user)
    passcode "5eeaad"
  end
end
