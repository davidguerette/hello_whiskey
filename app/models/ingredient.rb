class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :component
  has_many :substitutions
  has_many :substitutes, through: :substitutions, foreign_key: 'substitute_id', class_name: 'Component'

  validates :component, presence: true
end
