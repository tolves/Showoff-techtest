require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit sessions_url
  #
  #   assert_selector "h1", text: "Sessions"
  # end
  test "login" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
  end

  test "login failed" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "1234567"
    click_on "login"
    assert_selector "p", text: "Login failed"
  end

  test "log out" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    click_on "Logout"
    assert_selector "p", text: "Log out success"
  end
end
