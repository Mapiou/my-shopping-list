class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true
  validates :section,
            inclusion: { in: ["Maraîcher", "Boucherie", "Poissonnerie", "Epicerie"] }
end
