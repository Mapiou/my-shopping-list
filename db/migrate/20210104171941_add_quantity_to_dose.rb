class AddQuantityToDose < ActiveRecord::Migration[6.0]
  def change
    add_column :doses, :quantity, :integer
  end
end
