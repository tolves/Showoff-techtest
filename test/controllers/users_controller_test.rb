require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get resetpwd" do
    get users_resetpwd_url
    assert_response :success
  end

  test "should get changepwd" do
    get users_changepwd_url
    assert_response :success
  end

end
