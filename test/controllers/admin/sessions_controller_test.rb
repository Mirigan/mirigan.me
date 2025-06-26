require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_admin_session_url
    assert_response :success
  end

  test "should create a session" do
    post admin_session_url, params: { email_address: users(:admin).email_address, password: "password" }

    assert_redirected_to admin_root_url
    assert_equal 1, users(:admin).sessions.count
  end

  test "shouldn't create a session" do
    post admin_session_url, params: { email_address: users(:not_admin).email_address, password: "password" }

    assert_redirected_to new_admin_session_url
    assert_equal 0, users(:not_admin).sessions.count
  end
end
