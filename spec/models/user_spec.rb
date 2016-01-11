require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: "jphoenix@gmail.com", password_digest: "password")
  end

  it "is invalid if it doesn't have an email" do
    @user.email = ""
    expect(@user).to_not be_valid
  end

  it "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    expect(@user).to_not be_valid
  end

  it "should only accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "should not accept invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end
end
