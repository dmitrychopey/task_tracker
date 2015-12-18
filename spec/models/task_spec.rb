require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
		expect(FactoryGirl.build(:task)).to be_valid
	end


	it "is invalid without a title" do
		expect(FactoryGirl.build(:task, title: nil)).not_to be_valid
	end
	it "is invalid without a description" do
		expect(FactoryGirl.build(:task, description: nil)).not_to be_valid
	end
	it "is invalid without a duration" do
		expect(FactoryGirl.build(:task, duration: nil)).not_to be_valid
	end
	it "is invalid without a status" do
		expect(FactoryGirl.build(:task, status: nil)).not_to be_valid
	end
	
end
