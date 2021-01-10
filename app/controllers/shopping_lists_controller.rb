class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.doses.each do |dose|
      ShoppingList.create(dose_id: dose.id)
    end
  end
end
