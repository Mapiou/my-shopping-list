class Ingredient < ApplicationRecord
  SECTIONS = %w[Maraîcher Boucherie Poissonnerie Fromagerie Épicerie Boulangerie]

  has_many :doses

  validates :name, uniqueness: true, presence: true
  validates :section,
            inclusion: { in: SECTIONS }
end
