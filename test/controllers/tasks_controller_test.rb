require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: 'Test Category')
  end

  test "should get index" do
    get category_tasks_path(@category)
    assert_response :success
  end
end
