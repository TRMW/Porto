require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @project = projects(:project_one)
    @image = images(:image_one)
  end

  test "should show image" do
    get :show, :project_id => @project.to_param, :id => @image.to_param
    assert_response :success
    assert_not_nil assigns(:project)
    assert_not_nil assigns(:image)
  end
end
