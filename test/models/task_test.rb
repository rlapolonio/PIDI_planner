require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @current_user = users(:user01)
    @category = categories(:one)
  end
  
  test "should create valid task under existing category" do
    task = @category.tasks.build(name: 'test task name', description: 'test task description', deadline: DateTime.now.tomorrow.to_date)
    assert_difference '@category.tasks.count', 1 do
      task.save
    end
  end

  test "should not create task without name" do
    task = @category.tasks.build(description: 'test task description', deadline: DateTime.now.tomorrow.to_date)
    assert_not task.save, "Tried to save task with no name"
  end

  test "should not create task with taken name" do
    task = @category.tasks.build(name: 'test task name', description: 'test task description', deadline: DateTime.now.tomorrow.to_date)
    task.save
    task2 = @category.tasks.build(name: 'test task name', description: 'test task description', deadline: DateTime.now.tomorrow.to_date)
    assert_not task2.save, "Tried to save task with taken name"
  end
end
