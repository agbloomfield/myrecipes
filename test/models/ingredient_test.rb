require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  
  def setup
    @ingredient = Ingredient.new(name: "ingredient")
  end
  
  test "ingredient should be valid" do
    assert @ingredient.valid?
  end
  
  test "ingredient name should be present" do
    @ingredient.name = " "
    assert_not @ingredient.valid?
  end
  
  test "name should be more than three characters" do
    @ingredient.name = "a" * 2
    assert_not @ingredient.valid?
  end
  
end