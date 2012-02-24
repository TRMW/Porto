require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    log_in_user
    @post = posts(:post_one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => @post.attributes
    end

    assert_redirected_to page_path(Settings.blog_title.downcase.parameterize, (assigns(:post)))
  end

  test "should get edit" do
    get :edit, :id => @post.to_param
    assert_response :success
  end

  test "should update post" do
    put :update, :id => @post.to_param, :post => @post.attributes
    assert_redirected_to page_path(Settings.blog_title.downcase.parameterize, (assigns(:post)))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => @post.to_param
    end

    assert_redirected_to admin_path
  end
end
