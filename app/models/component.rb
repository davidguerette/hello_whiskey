class Component < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients
  belongs_to :category

  validates :name, presence: true
end
