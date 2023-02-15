class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = current_user.recipe_foods
  end

  def new
    @recipe_food = Recipe_Food.new
  end

  def create
    @recipe_food = current_user.recipes.new(recipe_food_params)

    if @recipe_food.save
      redirect_to user_recipes_url, notice: 'ingredient was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:name, :quantity, :recipe_id, :food_id)
  end
end
