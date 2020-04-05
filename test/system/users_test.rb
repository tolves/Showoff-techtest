require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "register new user" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: "yadong"
    fill_in "register_last_name", with: "autotest1"
    fill_in "register_password", with: "12345678"
    fill_in "register_email", with: "yadongwang1117+autotest2@gmail.com"
    click_on "submit"
    assert_selector "p", text: "Register success"
  end
  test "register new user: Email has already been taken" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: "yadong"
    fill_in "register_last_name", with: "autotest1"
    fill_in "register_password", with: "12345678"
    fill_in "register_email", with: "yadongwang1117+autotest2@gmail.com"
    click_on "submit"
    assert_selector "p", text: "Register failed: Email has already been taken"
  end
  test "register new user first name can not empty" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: ""
    fill_in "register_last_name", with: "autotest1"
    fill_in "register_password", with: "1234567"
    fill_in "register_email", with: "yadongwang1117+autotest4@gmail.com"
    click_on "submit"
    assert_selector "p", text: "Firstname, Lastname, Password can not be empty"
  end
  test "register new user last name can not empty" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: "aaa"
    fill_in "register_last_name", with: ""
    fill_in "register_password", with: "1234567"
    fill_in "register_email", with: "yadongwang1117+autotest5@gmail.com"
    click_on "submit"
    assert_selector "p", text: "Firstname, Lastname, Password can not be empty"
  end
  test "register new user password can not empty" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: "aaa"
    fill_in "register_last_name", with: "sdf"
    fill_in "register_password", with: ""
    fill_in "register_email", with: "yadongwang1117+autotest6@gmail.com"
    click_on "submit"
    assert_selector "p", text: "Firstname, Lastname, Password can not be empty"
  end
  test "register new user, email can not empty" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: "aaa"
    fill_in "register_last_name", with: "sdf"
    fill_in "register_password", with: "asdfasddf"
    fill_in "register_email", with: ""
    click_on "submit"
    assert_selector "p", text: "Firstname, Lastname, Password can not be empty"
  end

  test "register new user password length less than 8" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: "yadong"
    fill_in "register_last_name", with: "autotest1"
    fill_in "register_password", with: "1234567"
    fill_in "register_email", with: "yadongwang1117+autotest3@gmail.com"
    click_on "submit"
    assert_selector "p", text: "Password is too short"
  end

  test "register new user, email format should correct" do
    visit widget_index_url
    click_on "Login"
    click_on "register"
    fill_in "register_first_name", with: "aaa"
    fill_in "register_last_name", with: "sdf"
    fill_in "register_password", with: "asdfasddf"
    fill_in "register_email", with: "yadongwang1117+autotest7"
    click_on "submit"
    assert_selector "p", text: "is not an email"
  end
  test "reset password: email format error" do
    visit widget_index_url
    click_on "Login"
    click_on "resetpwd"
    fill_in "resetpwd_email", with: "aaa"
    click_on "submit"
    assert_selector "p", text: "is not an email"
  end
  test "reset password: success" do
    visit widget_index_url
    click_on "Login"
    click_on "resetpwd"
    fill_in "resetpwd_email", with: "yadongwang1117@gmail.com"
    click_on "submit"
    assert_selector "p", text: "Reset password success"
  end
  test "update user profile" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    click_on "update_profile"
    fill_in "update_user_first_name", with: "laldfalf"
    fill_in "update_user_last_name", with: "ln"
    click_on "submit"
    assert_selector "p", text: "Update User Information success"
  end
  test "change password" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    click_on "change_password"
    fill_in "changepwd_current_password", with: "123456789"
    fill_in "changepwd_new_password", with: "123456789"
    click_on "submit"
    assert_selector "p", text: "Change password success"
  end
  test "change password: new password length too short" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    click_on "change_password"
    fill_in "changepwd_current_password", with: "123456789"
    fill_in "changepwd_new_password", with: "123459"
    click_on "submit"
    assert_selector "p", text: "Password length must be >7"
  end

  test "My widgets index" do
    visit widget_index_url
    click_on "Login"
    fill_in "login_username", with: "yadong+test@showoff.ie"
    fill_in "login_password", with: "123456789"
    click_on "login"
    assert_selector "p", text: "Login success"
    visit users_index_me_url
    assert_selector "th", text: "Widget name"
  end
end
