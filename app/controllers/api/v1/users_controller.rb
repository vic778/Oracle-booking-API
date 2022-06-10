class Api::V1::UsersController < ApplicationController
    before_action :authorized, only: [:show, :update, :destroy]
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        if @users
        render json: @users
        end
    end

    def show
        if @user
        render json: @user
        end

    end

    def create
        @user = User.create(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
        render json: {success: true, messsage: "User created successfully"}, status: :created
        else
        render json: {success: false, message: @user.errors.full_messages}, status: :bad_request
        end
    end

    def update
        if @user.update(user_params)
        render json: {success: true, messsage: "User updated successfully"}, status: :created
        else
        render json: {success: false, message: @user.errors.full_messages}, status: :bad_request
        end
    end

    def destroy
        if @user.destroy
        render json: {success: true, messsage: "User deleted successfully"}, status: :created
        else
        render json: {success: false, message: @user.errors.full_messages}, status: :bad_request
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end
end
