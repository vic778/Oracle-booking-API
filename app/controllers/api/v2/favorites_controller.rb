class Api::V2::FavoritesController < ApplicationController
    before_action :authorized

    def create
        @favorite = Favorite.new(favorite_params.merge(user: @user))
        if @car = Car.find_by(id: params[:car_id])
            if @favorite.save
                @car.update(favorite: true)
                render json: { success: true, message: "Car favorited successfully", favorite: @favorite }, status: :created
            else
                render json: { success: false, message: "Car has been favorited", errors: @favorite.errors.full_messages },
                    status: :unprocessable_entity
            end
        else
            render json: { success: false, message: "Car not found" }, status: :not_found
        end
    end

    def destroy
        @favorite = @user.favorites.find_by(id: params[:id])
        if @car = Car.find(@favorite.car_id)
            if @favorite.destroy
                @car.update(favorite: false)
                render json: { success: true, message: "Car unfavorited successfully" }, status: :ok
            else
                render json: { success: false, message: "Car not unfavorited" }, status: :unprocessable_entity
            end
        else
            render json: { success: false, message: "Car not found" }, status: :not_found
        end
    end

    private

    def favorite_params
        params.permit(:car_id)
    end
end
