require 'rails_helper'
require_relative './sessions_spec'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/v1/users" do
    before(:each) do
      user_params = {
        name: 'Victor',
        email: 'barhvictor@gmail.com',
        password: '123456',
        password_confirmation: '123456'
      }
      post '/api/v1/users/register', params: user_params
    end

    it "returns http success" do
      get '/api/v1/users', headers: { Authorization: @token }
      expect(response).to have_http_status(:success)
    end
  end

  context "logs a user a" do
    scenario "he can update his profile" do
      user = build(:user)
      user.save
      post '/api/v1/auth/login', params: { email: user.email, password: user.password }
      put '/api/v1/users/1', params: { name: "Vi" }, headers: { Authorization: @token }

      expect(response).to have_http_status(:success)
    end
  end
end
