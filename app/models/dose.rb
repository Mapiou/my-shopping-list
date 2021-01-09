class Dose < ApplicationRecord
  UNITS = ['g', 'pièce', 'cm', 'ml', 'cs', 'cc']

  belongs_to :recipe
  belongs_to :ingredient
  has_many :shopping_lists

  validates :recipe_id, :ingredient_id, presence: true
  validates_uniqueness_of :recipe_id, scope: [:ingredient_id]
  validates :quantity, numericality: { greater_than: 0 }
  validates :unit, inclusion: { in: UNITS }
end
