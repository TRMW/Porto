require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "can save valid post with title, body and image and slug is generated" do 
    post = Post.new
    post.title = 'Test Post'
    post.body = 'There was a guy who did stuff.'
    post.image = Rack::Test::UploadedFile.new(Rails.root.join("test/unit/images/photo.jpg"), 'image/jpg')
    assert post.save, "Saved project"
    assert post.slug, "Slug generated"
  end
  
end
