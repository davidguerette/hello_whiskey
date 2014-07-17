class Component < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients
  has_many :substitutes, foreign_key: 'substitute_id'
  belongs_to :category

  validates :name, presence: true
end
