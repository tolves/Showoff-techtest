require "application_system_test_case"

class WidgetsTest < ApplicationSystemTestCase
  test "widgets search in visible public" do
    visit widget_index_url
    fill_in "search_term", with: "qwr"
    click_on "search"
    assert_selector "td", text: "2161"
  end
  test "widgets search in my widgets" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    fill_in "search_term", with: "qwr"
    click_on "search"
    assert_selector "td", text: "2161"
  end
  test "create a new widget, keep name empty" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    click_on "create"
    fill_in "create_name", with: ""
    fill_in "create_description", with: "desc"
    click_on "submit"
    assert_selector "p", text: "Name can not be empty"
  end
  test "create a new widget" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    click_on "create"
    fill_in "create_name", with: "new widget name auto test"
    fill_in "create_description", with: "desc"
    click_on "submit"
    assert_selector "p", text: "Create widget success"
  end
  test "create a new widget: already exist name" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    click_on "create"
    fill_in "create_name", with: "new widget name auto test"
    fill_in "create_description", with: "desc"
    click_on "submit"
    assert_selector "p", text: "Name has already been taken"
  end
  test "create a new widget: keep name empty" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    click_on "create"
    fill_in "create_name", with: ""
    fill_in "create_description", with: "desc"
    click_on "submit"
    assert_selector "p", text: "Name can not be empty"
  end
  test "create a new widget: keep desc empty" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    click_on "create"
    fill_in "create_name", with: "asdfadf"
    fill_in "create_description", with: ""
    click_on "submit"
    assert_selector "p", text: "Create widget failed: Description can't be blank"
  end
  test "update a widget" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    click_on "update_widget_2163"
    fill_in "update_name", with: "auto test update name"
    fill_in "update_description", with: "auto test update desc"
    click_on "submit"
    assert_selector "p", text: "Update widget success"
  end
  test "delete a widget" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    click_on "delete_widget_2163"
    click_on "Yes"
    assert_selector "p", text: "Delete widget success"
  end
end
