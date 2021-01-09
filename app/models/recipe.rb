class Recipe < ApplicationRecord
  SEASONS = ['Hiver', 'Printemps', 'Eté', 'Automne']
  CATEGORIES = ['Végétarien', 'Poisson', 'Viande']

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, :photo, presence: true
  validates :cooking_time,
            numericality: { only_integer: true, greater_than: 0 }
  validates :week_nb,
            numericality: { only_integer: true },
            inclusion: { in: 1..53 }
  validates :season, inclusion: { in: SEASONS }
  validates :category, inclusion: { in: CATEGORIES }
end
