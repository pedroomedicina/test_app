require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.new(name: "sports")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true);
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get categories_path, params: {id: @category.id}
    assert_response :success
  end

  test "sould redirect create when admin not logged in" do
    assert_no_difference "Category.count" do
      post categories_path, params: {category: { name: "sports" }}
    end
    assert_redirected_to categories_path
  end

end
