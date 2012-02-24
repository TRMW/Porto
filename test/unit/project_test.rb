require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "can save valid project with title and image and slug is generated" do 
    project = Project.new
    project.title = 'Test Project'
    image = Image.new
    image.file = Rack::Test::UploadedFile.new(Rails.root.join("test/unit/images/photo.jpg"), 'image/jpg')
    project.images = [ image ]
    assert project.save, "Saved project"
    assert project.slug, "Slug generated"
  end
  
  test "can't save project with title but no image" do 
    project = Project.new
    project.title = 'Test Project'
    assert !project.save, "Project save should fail"
  end
  
  test "can't save project with image but no title" do 
    project = Project.new
    image = Image.new
    image.file = Rack::Test::UploadedFile.new(Rails.root.join("test/unit/images/photo.jpg"), 'image/jpg')
    project.images = [ image ]
    assert !project.save, "Project save should fail"
  end
  
  test "can save project when image is missing file attachment" do 
    project = Project.new
    project.title = 'Test Project'
    image = Image.new
    project.images = [ image ]
    assert !project.save, "Project save should fail"
  end
  
end
