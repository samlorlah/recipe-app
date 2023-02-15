class RecipesController < ApplicationController

  def index
    @recipes = current_user.recipes.where(user_id: params[:food_id])
  end
  
  def new
    @recipe = current_user.recipes.new(user_id: params[:food_id])
  end

  def create
    @recipe = current_user.foods.new(recipe_params)

    if @recipe.save
      redirect_to user_food_recipes_url, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @Recipe.destroy
      flash[:success] = 'Recipe was successfully removed.'
    else
      flash[:error] = 'Error: Recipe could not be removed'
    end
    redirect_to user_food_recipes_url
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :preparation_time, :cooking_time, :description, :public)
  end
end
