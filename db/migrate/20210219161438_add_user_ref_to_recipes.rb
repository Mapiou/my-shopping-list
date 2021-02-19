class AddUserRefToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :user, null: true, foreign_key: true
    add_reference :shopping_lists, :user, null: true, foreign_key: true
    add_reference :ingredients, :user, null: true, foreign_key: true
  end
end
