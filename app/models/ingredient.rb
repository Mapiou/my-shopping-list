class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :section,
            inclusion: { in: ["Maraîcher", "Boucherie", "Poissonnerie", "Epicerie"] }
end
