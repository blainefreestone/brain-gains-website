FactoryBot.define do
  factory :engagement do
    student
    details { "These are details" }
    subject { "This is a subject" }
    availability { "This is availability" }
    fifteen_minutes_per_week { rand(4..12) }
  end
end
