class Dose < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :unit, inclusion: { in: ["g", "pièce", "ml", "cs", "cc"] }
end
