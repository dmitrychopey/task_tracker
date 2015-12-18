FactoryGirl.define do
  factory :task do
    title {Faker::App.name}
description {Faker::App.name}
duration {Faker::Number.number(2)}
status_id {status} #check this 
  end

end
