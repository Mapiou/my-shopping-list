class AddQuantityToShoppingList < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_lists, :quantity, :integer
  end
end
