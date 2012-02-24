require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    log_in_user
    @project = projects(:project_one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    new_project = Project.new
    new_project.title = 'Test Project'
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/unit/images/photo.jpg"), 'image/jpg')
    
    assert_difference('Project.count') do
      post :create, :project => new_project.attributes.merge("images_attributes" => { "0"=> { "file" => file } })
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, :id => @project.to_param
    assert_response :success
    assert_not_nil assigns(:project)
    assert_not_nil assigns(:image)
  end

  test "should get edit" do
    get :edit, :id => @project.to_param
    assert_response :success
  end

  test "should update project" do
    put :update, :id => @project.to_param, :project => @project.attributes
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :id => @project.to_param
    end

    assert_redirected_to admin_path
  end
end
