require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  setup do
    log_in_user
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_not_nil assigns(:posts)
  end
  
  test "password page should redirect to admin index if user already set" do
    get :password
    assert_redirected_to root_path
  end
end
