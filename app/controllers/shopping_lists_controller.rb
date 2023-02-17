class ShoppingListsController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @recipe_foods = RecipeFood.where(recipe_id: @recipes.ids).includes(:food).order(:id)

    @missing_ingredients = @recipe_foods.select { |ingredient| ingredient.quantity > ingredient.food.quantity }
    @missing_ingredients = @missing_ingredients.map do |ingredient|
      {
        name: ingredient.food.name,
        unit: ingredient.food.measurement_unit,
        quantity: ingredient.quantity - ingredient.food.quantity,
        price: ingredient.food.price * (ingredient.quantity - ingredient.food.quantity)
      }
    end

    @total_price = @missing_ingredients.map { |ingredient| ingredient[:price] }.sum
  end
end
