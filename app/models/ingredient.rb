class Ingredient < ApplicationRecord
  SECTIONS = ['Maraîcher', 'Boucherie', 'Poissonnerie', 'Fromagerie', 'Epicerie', 'Boulangerie']

  has_many :doses

  validates :name, uniqueness: true, presence: true
  validates :section,
            inclusion: { in: SECTIONS }
end
