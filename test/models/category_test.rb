require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save a category with no name" do
    category = Category.new
    assert_not category.save, "Saved a category with no name"
  end

  test "should not save a category with a taken name" do
    category = Category.create(name: 'test 1')
    category.save
    category2 = Category.create(name: 'test 1')
    assert_not category2.save, "Saved a category with a taken name"
  end
end
