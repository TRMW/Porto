require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test "can save valid image with file attachment" do 
    image = Image.new
    image.file = Rack::Test::UploadedFile.new(Rails.root.join("test/unit/images/photo.jpg"), 'image/jpg')
    project = Project.new
    project.title = 'Image Project'
    image.project = project
    assert image.save, "Saved image"
  end
  
  test "can't save image without file attachment" do 
    image = Image.new
    project = Project.new
    project.title = 'Image Project'
    image.project = project
    assert !image.save, "Image save should fail"
  end
  
end
