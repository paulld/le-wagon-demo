class Api::V1::RestaurantsController < Api::V1::BaseController
  before_action :authenticate_by_token, only: [:update]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant

    @restaurant.update(name: params[:name])
  end

  private

  # def restaurant_params
  #   binding.pry
  #   params.require(:restaurant).permit(:name, :user_id)
  # end
end
