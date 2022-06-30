require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "GET /api/v1/authentications" do
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
      user_params = {
        email: 'barhvictor@gmail.com',
        password: '123456'
      }
      post '/api/v1/auth/login', params: user_params
      expect(response).to have_http_status(:accepted)
    end

    it "returns http unauthorized" do
      user_params = {
        email: '',
        password: '123456'
      }
      post '/api/v1/auth/login', params: user_params
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns token' do
      user_params = {
        email: 'barhvictor@gmail.com',
        password: '123456'
      }
      post '/api/v1/auth/login', params: user_params
      expect(response.body).to include('token')
    end

    it 'returns user' do
      user_params = {
        email: 'barhvictor@gmail.com',
        password: '123456'
      }
      post '/api/v1/auth/login', params: user_params
      expect(response.body).to include('user')
    end

    it 'returns correct user' do
      user_params = {
        email: 'barhvictor@gmail.com',
        password: '123456'
      }
      post '/api/v1/auth/login', params: user_params
      expect(response.body).to include('"name":"Victor"')
    end
  end
end
