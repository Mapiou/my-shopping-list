class Ingredient < ApplicationRecord
  SECTIONS = ['Maraîcher', 'Boucherie', 'Poissonnerie', 'Fromagerie', 'Epicerie']

  has_many :doses

  validates :name, presence: true
  validates :section,
            inclusion: { in: SECTIONS }
end
