class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_many :components, through: :ingredients
  has_many :categories, through: :ingredients

  validates :name, presence: true
  validates :directions, presence: true
end
