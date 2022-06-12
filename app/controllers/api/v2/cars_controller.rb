class Api::V2::CarsController < ApplicationController
    before_action :authorized
    before_action :set_car, only: [:show, :update, :destroy]

    def index
        @cars = Car.all
        render json: @cars
    end

    def show
        render json: @car
    end

    def create
        @car = Car.create(car_params.merge(user: @user))
        if @car.valid?
            render json: {success: true, message: "Car created successfully", car: @car}, status: :created
        else
            render json: {success: false, message: "Car not created", errors: @car.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @car.update(car_params)
            render json: {success: true, message: "Car updated successfully", car: @car}, status: :ok
        else
            render json: {success: false, message: "Car not updated", errors: @car.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @car.destroy
        render json: {success: true, message: "Car deleted successfully"}, status: :ok
    end

    private

    def set_car
        @car = @user.cars.find(params[:id])
    end

    def car_params
        params.permit(:title, :model, :price, :description, :image)
    end
end
