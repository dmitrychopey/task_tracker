require 'rails_helper'

RSpec.describe User, type: :model do
	
	it "has a valid factory" do
		expect(FactoryGirl.build(:user)).to be_valid
	end
	it "is invalid without a email" do
		expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
	end
	it "is invalid with too long email" do
		expect(FactoryGirl.build(:user, email: "a"*200+"@email.com")).not_to be_valid
	end
	it "is valid with correct email adress" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
	  	valid_addresses.each do |valid_address|
	  		expect(FactoryGirl.build(:user, email: valid_address)).to be_valid
	  	end
	end
	it "is invalid with incorrect email adress" do
		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
	    invalid_addresses.each do |invalid_addresse|
	   		expect(FactoryGirl.build(:user, email: invalid_addresse)).not_to be_valid
	    end
	end

	it "is invalid if email is not unique" do
		user = FactoryGirl.create(:user)
		user2 = user.dup
		expect(user2).not_to be_valid

	end

	it "is invalid without password" do
		expect(FactoryGirl.build(:user, password: nil)).not_to be_valid

	end

	it "is invalid with too short password" do
		expect(FactoryGirl.build(:user, password: "1"*7 )).not_to be_valid

	end
	
end
