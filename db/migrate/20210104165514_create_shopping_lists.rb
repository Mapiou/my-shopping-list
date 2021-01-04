class CreateShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists do |t|
      t.references :dose, null: false, foreign_key: true

      t.timestamps
    end
  end
end
