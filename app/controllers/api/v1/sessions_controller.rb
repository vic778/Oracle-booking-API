class Api::V1::SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { success: true, user: @user, token: token }, status: :accepted
    else
      render json: { success: false, message: "Invalid email or password" }, status: :unauthorized
    end
  end
end
