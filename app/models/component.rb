class Component < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients
  has_many :categories, through: :ingredients

  validates :name, presence: true
end
