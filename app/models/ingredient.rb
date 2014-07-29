LIQUID_MEASURE_UNITS = ['oz','tsp']

class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :component
  has_many :substitutions
  has_many :substitutes, through: :substitutions, foreign_key: 'substitute_id', class_name: 'Component'

  validates :component, presence: true

  def display_quantity
    if self.quantity
      if self.quantity % 1 == 0
        quantity.to_i
      else
        if self.quantity > 1
          remainder = (quantity % 1)
          integer = (quantity - remainder).to_i
          "#{integer} #{remainder.to_r}"
        else self.quantity < 1
          quantity.to_r
        end
      end
    end
  end

  #citrus ingredient display:
  # 1 twist orange => 1 orange twist
  # juice
  #

  def citrus_liquid_measure?
    if self.component.category.name == 'citrus' && LIQUID_MEASURE_UNITS.include?(self.unit)
      true
    else
      false
    end
  end
end
