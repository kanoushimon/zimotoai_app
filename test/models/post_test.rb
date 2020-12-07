require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(content: "この街に行ってきました。")
  end
  
  test "should be valid" do
    assert @post.valid?
  end
  
  test "content should be present" do
    @post.content = "  "
    assert_not @post.valid?
  end
  
  test "content shoudlnot be longer than 200" do
    @post.content = "a" * 201
    assert_not @post.valid?
  end
  
end