class Recipe < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses

  validates :name, :photo, presence: true
  validates :cooking_time,
            numericality: { only_integer: true, greater_than: 0 }
  validates :week_nb,
            numericality: { only_integer: true },
            inclusion: { in: 1..53 }
  validates :season, inclusion: { in: ["Hiver", "Printemps", "Eté", "Automne"] }
  validates :category, inclusion: { in: ["Végétarien", "Poisson", "Viande"] }
end
