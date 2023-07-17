require "application_system_test_case"

class UserRecipesTest < ApplicationSystemTestCase
  setup do
    @user_recipe = user_recipes(:one)
  end

  test "visiting the index" do
    visit user_recipes_url
    assert_selector "h1", text: "User recipes"
  end

  test "should create user recipe" do
    visit user_recipes_url
    click_on "New user recipe"

    click_on "Create User recipe"

    assert_text "User recipe was successfully created"
    click_on "Back"
  end

  test "should update User recipe" do
    visit user_recipe_url(@user_recipe)
    click_on "Edit this user recipe", match: :first

    click_on "Update User recipe"

    assert_text "User recipe was successfully updated"
    click_on "Back"
  end

  test "should destroy User recipe" do
    visit user_recipe_url(@user_recipe)
    click_on "Destroy this user recipe", match: :first

    assert_text "User recipe was successfully destroyed"
  end
end
