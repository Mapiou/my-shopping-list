class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  has_many :shopping_lists

  validates :unit, inclusion: { in: ["g", "pièce", "ml", "cs", "cc"] }
end
