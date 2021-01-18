class ShoppingListsController < ApplicationController
  before_action :set_recipe, only: %i[create update]

  def index
    @shopping_lists = ShoppingList.all
    @doses = {}
    @shopping_lists.each do |item|
      item.recipe.doses.each do |dose|
        if @doses.key?(dose.ingredient_id) && @doses[dose.ingredient_id][:unit] == dose.unit
          @doses[dose.ingredient_id][:quantity] += dose.quantity
        else
          @doses[dose.ingredient_id] = { name: dose.ingredient.name,
                                         quantity: dose.quantity,
                                         unit: dose.unit }
        end
      end
    end
  end

  def create
    @item = ShoppingList.find_by(recipe: @recipe)

    if @item.nil?
      ShoppingList.create(recipe: @recipe, quantity: 1)
    else
      @item.update(quantity: @item.quantity + 1)
    end

    redirect_to recipes_path(anchor: "recipe-#{@recipe.id}")
  end

  def update
    @item = ShoppingList.find_by(recipe: @recipe)

    return unless @item.present?

    @item.update(quantity: @item.quantity - 1) if @item.quantity.positive?
    @item.destroy if @item.quantity.zero?

    redirect_to recipes_path(anchor: "recipe-#{@recipe.id}")
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
