class Dose < ApplicationRecord
  UNITS = %w[g pièce ml cs cc cm]

  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe_id, presence: true
  validates_uniqueness_of :ingredient_id, scope: [:recipe_id]
  validates :quantity, numericality: { greater_than: 0 }
  validates :unit, inclusion: { in: UNITS }
end
