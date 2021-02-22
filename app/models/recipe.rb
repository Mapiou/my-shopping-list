class Recipe < ApplicationRecord
  SEASONS = %w[Hiver Printemps Été Automne]
  CATEGORIES = %w[Poisson Végétarien Viande\ blanche Viande\ rouge]

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :shopping_lists, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :name, :photo, presence: true
  validates :cooking_time,
            numericality: { only_integer: true, greater_than: 0 }
  validates :week_nb,
            numericality: { only_integer: true, greater_than: 0, less_than: 54 }
  validates :season, inclusion: { in: SEASONS }
  validates :category, inclusion: { in: CATEGORIES }
end
