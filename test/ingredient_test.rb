require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest <Minitest::Test
  def setup
    @ingredient = Ingredient.new("Sugar", "oz", 55)
  end

  def test_it_exists
    assert_instance_of Ingredient, @ingredient
  end

  def test_it_has_attributes
    assert_equal "Sugar", @ingredient.name
    assert_equal "oz", @ingredient.unit
    assert_equal 55, @ingredient.calories
  end
end
