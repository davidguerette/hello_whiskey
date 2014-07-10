class RecipeSearch

  attr_accessor :component_ids

  def initialize(component_ids)
    component_ids = component_ids.delete_if{|x| x==""}
    @component_ids = component_ids
  end

  def search
    binding.pry
  end
end
