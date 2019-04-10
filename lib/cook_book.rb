class CookBook
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary = Hash.new{|hash,key| hash[key]= {}}
    @recipes.each do |recipe|
      summary[:name] = recipe.name,
      summary[:details][:ingredients] = recipe.ingredients,
      summary[:total_calories] = recipe.total_calories
    end
    summary
  end
end
