class Api::V2::CarsController < ApplicationController
  before_action :authorized, except: %i[index show]
  before_action :set_car, only: %i[update]

  def index
    @cars = Car.all
    if @cars
      render json: @cars
    else
      render json: { success: false, message: "[]" }, status: :not_found
    end
  end

  def show
    @car = Car.find(params[:id])
    render json: @car
  end

  def create
    @car = Car.create(car_params.merge(user: @user))
    if @car.save
      render json: { success: true, message: "Car created successfully", car: @car }, status: :created
    else
      render json: { success: false, message: "Car not created", errors: @car.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      render json: { success: true, message: "Car updated successfully", car: @car }, status: :ok
    else
      render json: { success: false, message: "Car not updated", errors: @car.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @car = @user.cars.find_by(id: params[:id])
      if @car.favorite == false
        @car.destroy
        render json: { success: true, message: "Car deleted successfully" }, status: :ok
      else
        render json: { success: false, message: "This car is favorited by someone else" },
               status: :unprocessable_entity
      end
    else
      render json: { success: false, message: "Only the owner can delete this car" }, status: :not_found
    end
  end

  private

  def set_car
    @car = @user.cars.find(params[:id])
  end

  def car_params
    params.permit(:title, :model, :price, :description, :image)
  end
end
