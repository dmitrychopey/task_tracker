require 'rails_helper'

RSpec.describe Status, type: :model do

  	it "has a valid factory" do
		expect(FactoryGirl.build(:status)).to be_valid
	end

	it "is invalid without a title" do
		expect(FactoryGirl.build(:status, title: nil)).not_to be_valid
	end
	
end
