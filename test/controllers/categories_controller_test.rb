require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:user01)
    post user_session_path
  end
  
  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should create new category" do
    post categories_path, params: { category: { name: "Chores" } }
    assert_response :redirect
  end

  test "should show existing category" do
    category = categories(:one)

    get category_path(category)
    assert_response :success
  end

  test "should edit an existing category" do
    category = categories(:two)

    get category_path(category)

    patch category_path(category), params: { category: { name: "edited" } }
    assert_response :redirect
  end

  test "should delete an existing category" do
    category = categories(:one)

    get category_path(category)

    delete category_path(category)
    assert_response :redirect
  end
end
