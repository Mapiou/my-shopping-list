class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.all

    @selected_recipes_count = {}
    ShoppingList.all.each do |item|
      if @selected_recipes_count.key?(item.recipe_id)
        @selected_recipes_count[item.recipe_id] += 1
      else
        @selected_recipes_count[item.recipe_id] = 1
      end
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def show
    @dose = Dose.new
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy

    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :photo, :cooking_time, :week_nb, :season, :category)
  end
end
