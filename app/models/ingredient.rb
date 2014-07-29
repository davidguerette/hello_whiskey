LIQUID_MEASURE_UNITS = ['oz','tsp']

class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :component
  has_many :substitutions
  has_many :substitutes, through: :substitutions, foreign_key: 'substitute_id', class_name: 'Component'

  validates :component, presence: true

  def citrus_liquid_measure?
    if self.component.category.name == 'citrus' && LIQUID_MEASURE_UNITS.include?(self.unit)
      true
    else
      false
    end
  end
end
