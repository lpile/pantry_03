require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest <Minitest::Test
  def setup
    @recipe = Recipe.new("Cookies")
    @ingredient_1 = Ingredient.new("Sugar", "oz", 55)
    @ingredient_2 = Ingredient.new("Egg", "whole", 77)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @mac_and_cheese.add_ingredient(@cheese, 2)
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

  def test_it_can_list_of_ingredients
    @recipe.add_ingredient(@ingredient_1, 4)
    @recipe.add_ingredient(@ingredient_2, 2)

    assert_equal ["Sugar", "Egg"], @recipe.list_of_ingredients
  end

  def test_it_can_check_ingredient_quantity
    @recipe.add_ingredient(@ingredient_1, 4)

    assert_equal 4, @recipe.check_quantity(@ingredient_1)
  end

  def test_it_can_give_total_calories
    @recipe.add_ingredient(@ingredient_1, 4)
    @recipe.add_ingredient(@ingredient_2, 2)

    assert_equal 374, @recipe.total_calories
  end

  def test_it_can_return_summary
    expected = {:name=>"Mac and Cheese",
                :details=>{
                  :ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
                                 {:ingredient=>"Cheese", :amount=>"2 C"}],
                  :total_calories=>440}}
    assert_equal ({}), @mac_and_cheese.summary
  end
end
