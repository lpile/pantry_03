require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest <Minitest::Test
  def setup
    @recipe = Recipe.new("Cookies")
    @ingredient_1 = Ingredient.new("Sugar", "oz", 55)
    @ingredient_2 = Ingredient.new("Egg", "whole", 77)
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_it_has_attributes
    assert_equal "Cookies", @recipe.name
    assert_equal ({}), @recipe.ingredients
    assert_equal 0, @recipe.total_calories
  end

  def test_it_adds_ingredients
    @recipe.add_ingredient(@ingredient_1, 4)
    expected = {@ingredient_1 => 4}

    assert_equal expected, @recipe.ingredients
  end

  def test_it_adds_multiple_ingredients
    @recipe.add_ingredient(@ingredient_1, 4)
    @recipe.add_ingredient(@ingredient_2, 2)
    expected = {@ingredient_1 => 4,
                @ingredient_2 => 2}

    assert_equal expected, @recipe.ingredients
  end

  def test_it_can_give_quantity_of_ingredient
    @recipe.add_ingredient(@ingredient_1, 4)
    @recipe.add_ingredient(@ingredient_2, 2)

    assert_equal 4, @recipe.ingredients[@ingredient_1]
    assert_equal 2, @recipe.ingredients[@ingredient_2]
  end

  def test_it_can_give_total_calories
    @recipe.add_ingredient(@ingredient_1, 4)
    @recipe.add_ingredient(@ingredient_2, 2)

    assert_equal 374, @recipe.total_calories
  end
end
