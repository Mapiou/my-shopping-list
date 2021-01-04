class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  has_many :shopping_lists

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :unit, inclusion: { in: ["g", "pièce", "ml", "cs", "cc"] }
end
