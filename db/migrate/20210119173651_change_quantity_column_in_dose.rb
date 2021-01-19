class ChangeQuantityColumnInDose < ActiveRecord::Migration[6.0]
  def change
    change_column :doses, :quantity, :float
  end
end
