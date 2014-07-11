class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :component

  validates :component, presence: true
end
