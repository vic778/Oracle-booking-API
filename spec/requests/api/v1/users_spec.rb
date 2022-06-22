require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "POST /api/v1/users/register " do
    it "creates a new user" do
      @user = FactoryBot.build(:user)
      post "/api/v1/users/register",
           params: { name: @user.name, email: @user.email, password: @user.password,
                     password_confirmation: @user.password_confirmation }
      expect(response).to have_http_status(:created)
      expect(response.body).to include("User created successfully")
    end

    it "return all users" do
      @user = FactoryBot.create(:user)
      get "/api/v1/users"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/users/:id" do
    before(:each) do
      @user = FactoryBot.create(:user)
      post "/api/v1/auth/login", params: { email: @user.email, password: @user.password }
      @token = JSON.parse(response.body)["token"]
      @headers = { Authorization: "Bearer #{@token}" }
    end

    it "returns a user" do
      get "/api/v1/users/#{@user.id}", headers: @headers
      expect(response).to have_http_status(:ok)
    end

    it "updates a user" do
      put "/api/v1/users/#{@user.id}",
          params: { name: @user.name, email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation }, headers: @headers
      expect(response).to have_http_status(:ok)
    end

    it "deletes a user" do
      delete "/api/v1/users/#{@user.id}", headers: @headers
      expect(response).to have_http_status(:ok)
    end
  end
end
