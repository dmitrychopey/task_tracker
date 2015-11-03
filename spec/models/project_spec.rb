require 'rails_helper'

RSpec.describe Project, type: :model do
	
	it "has a valid factory" do
		expect(FactoryGirl.create(:project)).to be_valid
	end
	it "is invalid without a name" do
		expect(FactoryGirl.build(:project, name: nil)).not_to be_valid
	end
	it "is invalid without a description" do
		expect(FactoryGirl.build(:project, description: nil)).not_to be_valid
	end
	it "is invalid without a start date" do
		expect(FactoryGirl.build(:project, start_date: nil)).not_to be_valid
	end
	it "is invalid without a end date" do
		expect(FactoryGirl.build(:project, end_date: nil)).not_to be_valid
	end
	
end
