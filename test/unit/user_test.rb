require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "can save valid user with password" do
    user = User.new
    user.password = 'foo'
    assert user.save, "Saved user"
  end
  
  test "can't save user without password" do
    user = User.new
    assert !user.save, "User save should fail"
  end
end
