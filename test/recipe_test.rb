require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest <Minitest::Test
  def setup
    @recipe = Recipe.new("Cookies")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Cookies", @recipe.name
    assert_equal ({}), @recipe.ingredients
  end
end
