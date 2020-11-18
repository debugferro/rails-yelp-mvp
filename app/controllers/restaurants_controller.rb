class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # raise
    if @restaurant.save
      redirect_to @restaurant, notice: 'Successfully created!'
    else
      render :new
    end
  end

  def edit

  end

  def destroy
    @restaurant.destroy
    redirect_to root
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end


# <%= form_for (@restaurant) do |f| %>
# <%= f.label :name %>
# <%= f.text_field :name %>
# <%= f.label :address %>
# <%= f.text_field :address %>
# <%= f.label :phone_number %>
# <%= f.text_field :phone_number %>
# <% categories = [['Chinese', 'chinese'], ['Italian', 'italian'], ['Japanese', 'japanese'], ['French', 'french'], ['Belgian', 'belgian']] %>
# <%= f.label :category %>
# <%= select_tag :category, options_for_select(categories), name: 'restaurant[category]' %>
# <%= f.submit %>
# <% end %>   <% categories = ['Chinese', 'Italian', 'Japanese', 'French','Belgian'] %>
