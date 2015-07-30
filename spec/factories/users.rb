FactoryGirl.define do
  factory :user do
    email                 { "email@example.com" }
    password              { "supersecret" }
    password_confirmation { "supersecret" }
  end
end
