require 'test_helper'

class ChefsIndexTestTest < ActionDispatch::IntegrationTest
  
  def setup
    @chef = Chef.create!(chefname: "Andy", email: "andy@test.com",
                        password: "password", password_confirmation: "password")
    @chef2 = Chef.create!(chefname: "Liz", email: "liz@test.com",
                        password: "password", password_confirmation: "password")
  end
  
  test "should get chefs index" do
    get chefs_path
    assert_response :success
  end
  
  test "should get chefs listing" do
    get chefs_path
    assert_template 'chefs/index'
    assert_select "a[href=?]", chef_path(@chef), text: @chef.chefname.capitalize
    assert_select "a[href=?]", chef_path(@chef2), text: @chef2.chefname.capitalize
  end
end
