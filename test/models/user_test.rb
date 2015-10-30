require 'test_helper'

class UserTest < ActiveSupport::TestCase
	  # test "the truth" do
	  #   assert true
	  # end

	  def setup
	  	@user = User.new(email: "user@example.com", password: "12345678")
	  end

	  test "should be valid" do
	  	assert @user.valid?
	  end

	  test "email should be present" do
	  	@user.email = ""
	  	assert_not @user.valid?
	  end	

	  test "email should not be to long" do
	  	@user.email = "a"*200+"@email.com"
	  	assert_not @user.valid?
	  end

	  test "email validation should accept valid addresses" do
	  	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
	  	valid_addresses.each do |valid_address|
	  		@user.email = valid_address
	  		assert @user.valid?, "#{valid_address.inspect} should be valid"
	  	end
	  end

	  test "email validation should reject invalid addresses" do
	  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
	  	invalid_addresses.each do |invalid_address|
	  		@user.email = invalid_address
	  		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
	  	end
	  end

	  test "email should be unique" do
	  	d_user = @user.dup
	  	@user.save
	  	assert_not d_user.valid?
	  end

	  test "password should be present" do
	  	@user.password = "   "
	  	assert_not @user.valid?
	  end

	  test "password should have a minimum length" do
	  	@user.password = "a" * 7
	  	assert_not @user.valid?			
	  end


	end
