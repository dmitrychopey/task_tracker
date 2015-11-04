FactoryGirl.define do
  factory :task do
    title {Faker::App.name}
description {Faker::App.name}
duration {Faker::Number.number(2)}
status_id {Faker::Number.number(2)}
  end

end
