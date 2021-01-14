class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @item = ShoppingList.find_by(recipe: @recipe)

    if @item.nil?
      ShoppingList.create(recipe: @recipe, quantity: 1)
    else
      @item.update(quantity: @item.quantity + 1)
    end

    redirect_to recipes_path
  end
end
