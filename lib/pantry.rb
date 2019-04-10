class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new{|h,k| h[k] = 0}
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients.keys.each do |ingredient|
      if !@stock.keys.include?(ingredient) || recipe.ingredients[ingredient] > stock_check(ingredient)
        return false
      end
    end
    true
  end
end
