class Api::V2::MyFavoritesController < ApplicationController
  before_action :authorized

  def index
    @favorites = @user.favorites.all
    if @favorites
      render json: @favorites, status: :ok
    else
      render json: "[]", status: :not_found
    end
  end
end
