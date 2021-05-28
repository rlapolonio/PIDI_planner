require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: 'Test Category')
    @task = @category.tasks.build(name: 'test task', description: 'test description', deadline: DateTime.now.tomorrow)
    @task.save
  end

  test "should get index" do
    get category_tasks_path(@category)
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should create new task" do
    post category_tasks_path(@category), params: { task: { name: "test task name", description: 'test task description' } }
    assert_response :redirect
  end

  test "should show existing task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should edit an existing task" do
    get category_task_path(@category, @task)
    assert_response :success

    patch category_task_path(@category, @task), params: { task: { name: "edited", description: 'edited description' } }
    assert_response :redirect
  end

  test "should delete an existing category" do
    get category_task_path(@category, @task)
    assert_response :success

    delete category_task_path(@category, @task)
    assert_response :redirect
  end
end
