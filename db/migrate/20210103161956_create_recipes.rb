class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :photo
      t.integer :cooking_time
      t.integer :week_nb
      t.string :season
      t.string :category

      t.timestamps
    end
  end
end
