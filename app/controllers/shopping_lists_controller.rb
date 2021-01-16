class ShoppingListsController < ApplicationController
  before_action :set_recipe, only: %i[create update]

  def index
    @shopping_lists = ShoppingList.all
  end

  def create
    @item = ShoppingList.find_by(recipe: @recipe)

    if @item.nil?
      ShoppingList.create(recipe: @recipe, quantity: 1)
    else
      @item.update(quantity: @item.quantity + 1)
    end

    redirect_to recipes_path
  end

  def update
    @item = ShoppingList.find_by(recipe: @recipe)

    return unless @item.present?

    @item.update(quantity: @item.quantity - 1) if @item.quantity.positive?
    @item.destroy if @item.quantity.zero?

    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
