class Dose < ApplicationRecord
  UNITS = ['g', 'pièce', 'cm', 'ml', 'cs', 'cc']

  belongs_to :recipe
  belongs_to :ingredient
  has_many :shopping_lists

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit, inclusion: { in: UNITS }
end
