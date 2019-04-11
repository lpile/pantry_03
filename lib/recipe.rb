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
    total = 0
    @ingredients.each do |ingredient, amount|
      total += ingredient.calories * amount
    end
    total
  end

  def list_of_ingredients
    @ingredients.keys.map(&:name)
  end

  def check_quantity(ingredient)
    @ingredients[ingredient]
  end

  def summary
    {
      name: @name,
      details: {
        ingredients: ingredients_array,
        total_calories: total_calories
      }
    }
  end

  def ingredients_array
    @ingredients.map do |ingredient, amount|
      {ingredient: ingredient.name, amount: "#{amount} #{ingredient.unit}"}
    end
  end
end
