require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(@user).to be_valid
  end

  it "is invalid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without a password" do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without a password_confirmation" do
    @user.password_confirmation = nil
    expect(@user).to_not be_valid
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "barh@gmail.com")
    @user.email = "barh@gmail.com"
    expect(@user).to_not be_valid
  end

  it "is invalid with a password shorter than 6 characters" do
    @user.password = "12345"
    expect(@user).to_not be_valid
  end

  it "is invalid with a password_confirmation shorter than 6 characters" do
    @user.password_confirmation = "12345"
    expect(@user).to_not be_valid
  end

  it "is invalid with a password_confirmation different from password" do
    @user.password_confirmation = "123456"
    expect(@user).to_not be_valid
  end

    
end
