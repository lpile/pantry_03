class CookBook
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    @recipes.map {|recipe| recipe.summary}
  end
end
