require 'rails_helper'

RSpec.describe Car, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @car = FactoryBot.create(:car, user: @user)
  end

  it "is valid with valid attributes" do
    expect(@car).to be_valid
  end

  it "is not valid without a title" do
    @car.title = nil
    expect(@car).to_not be_valid
  end

  it "is not valid without a description" do
    @car.description = nil
    expect(@car).to_not be_valid
  end

  it "is not valid without a model" do
    @car.model = nil
    expect(@car).to_not be_valid
  end

  it "is not valid without a price" do
    @car.price = nil
    expect(@car).to_not be_valid
  end

  it "is not valid without a user" do
    @car.user = nil
    expect(@car).to_not be_valid
  end

  it "is not valid without an image" do
    @car.image = nil
    expect(@car).to_not be_valid
  end

end
