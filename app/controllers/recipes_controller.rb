class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @shopping_lists = ShoppingList.where(user: current_user).map do |item|
      [item.recipe_id, item.quantity]
    end.to_h

    @query = params[:query]
    if @query.present?
      sql_query = " \
        user = :user AND \
        (name @@ :query \
        OR season @@ :query \
        OR category @@ :query) \
      "
      @recipes = Recipe.where(sql_query, { user: current_user, query: @query })
    else
      @recipes = Recipe.where(user: current_user)
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
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
      redirect_to recipe_path(@recipe)
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
