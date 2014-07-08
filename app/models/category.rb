class Category < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients
  has_many :components, through: :ingredients

  validates :name, presence: true
end
