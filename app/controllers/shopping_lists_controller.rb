class ShoppingListsController < ApplicationController
  before_action :set_recipe, only: %i[create update]

  def index
    @shopping_lists = ShoppingList.all
    ingredients = Ingredient::SECTIONS.map { |section| [section, {}] }.to_h

    @shopping_lists.each do |item|
      item.recipe.doses.each do |dose|
        ingredient_id = dose.ingredient_id
        quantity = dose.quantity * item.quantity
        unit = dose.unit
        section = dose.ingredient.section

        if ingredients[section].key?(ingredient_id) && ingredients[section][ingredient_id][:unit] == unit
          ingredients[section][ingredient_id][:quantity] += quantity
        else
          ingredients[section][ingredient_id] = { name: dose.ingredient.name,
                                                  quantity: quantity,
                                                  unit: unit }
        end
      end
    end

    @sorted_ingredients = ingredients.transform_values do |doses|
      doses.sort_by { |_id, dose| dose[:name] }.to_h
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
