require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @current_user = users(:user01)
  end


  test "should not save a category with no name" do
    category = @current_user.categories.build
    assert_not category.save, "Saved a category with no name"
  end

  test "should not save a category with a taken name" do
    category = @current_user.categories.build(name: 'test 1')
    category.save
    category2 = @current_user.categories.build(name: 'test 1')
    assert_not category2.save, "Saved a category with a taken name"
  end
end
