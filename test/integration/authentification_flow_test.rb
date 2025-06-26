require "test_helper"

class AuthentificationFlowTest < ActionDispatch::IntegrationTest
  test "can authenticate to the admin and sign out" do
    get "/admin/session/new"
    assert_response :success
    assert_dom "h1", "Sign in"

    post "/admin/session", params: { email_address: users(:admin).email_address, password: "password" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_dom "h1", "Admin Index page"

    delete "/admin/session"
    assert_response :redirect
    assert_equal 0, Session.count
  end
end
