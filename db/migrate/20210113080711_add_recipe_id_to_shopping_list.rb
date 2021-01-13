class AddRecipeIdToShoppingList < ActiveRecord::Migration[6.0]
  def change
    remove_reference :shopping_lists, :dose, index: true
    add_reference :shopping_lists, :recipe, index: true
  end
end
