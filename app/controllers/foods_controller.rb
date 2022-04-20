class FoodsController < ApplicationController
  def index
    @foods = params[:letter].nil? ? Food.all : Food.by_letter(params[:letter])
  end

  def show
    @food = Food.find_by_id(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.create(params.require(:food))

    redirect_to foods_path
  end

  def edit
    @food = Food.find_by_id(params[:id])
  end

  def update
    @food = Food.find_by_id(params[:id])

    # Assign attribute dari params[:food] ke @food
    @food.update(params.require(:food))

    redirect_to foods_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to foods_path
  end

  private

  def update_food_params
    params.require(:food).permit(:name, :description)
  end
end
