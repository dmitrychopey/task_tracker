FactoryGirl.define do
	factory :project do
		name {Faker::App.name}
		description {Faker::App.name}
		start_date {Faker::Date.backward(14)}
		end_date {Faker::Date.forward(23)}
	end

end
