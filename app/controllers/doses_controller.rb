class DosesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new(dose_params)
    @dose.recipe = @recipe
    if @dose.save
      redirect_to recipe_path(@recipe, anchor: "dose-#{@dose.id}")
    else
      render 'recipes/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to recipe_path(@dose.recipe, anchor: "doses")
  end

  private

  def dose_params
    params.require(:dose).permit(:recipe_id, :ingredient_id, :quantity, :unit)
  end
end
