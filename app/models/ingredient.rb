class Ingredient < ApplicationRecord
  SECTIONS = %w[Maraîcher Boucherie Poissonnerie Fromagerie Épicerie Boulangerie]

  has_many :doses
  belongs_to :user

  validates :name, uniqueness: { scope: :user }, presence: true
  validates :section, inclusion: { in: SECTIONS }
end
