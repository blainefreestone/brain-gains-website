FactoryBot.define do
  factory :session do
    date { Date.today }
    length_fifteen_minutes { rand(4..12) }
    engagement
  end
end
