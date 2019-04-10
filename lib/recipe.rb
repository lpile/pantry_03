class Recipe
  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients.store(ingredient, quantity)
  end

  def total_calories
    total_calories = {}
    @ingredients.each do |ingredient|
      total_calories[ingredient.first.name] = ingredient.first.calories * ingredient.last
      # require 'pry'; binding.pry
    end
    total_calories.values.sum
  end
end
