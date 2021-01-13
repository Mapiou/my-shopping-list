class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = ShoppingList.all
  end

  def create
    ShoppingList.create(recipe_id: params[:recipe_id])
    redirect_to recipes_path
  end
end
