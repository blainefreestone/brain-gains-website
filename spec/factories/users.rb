FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password { "password" } 
  end

  factory :tutor, parent: :user do
    tutor { true }
  end

  factory :student, parent: :user do
    student { true }
  end
end
