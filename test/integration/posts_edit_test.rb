require 'test_helper'

class PostsEditTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:post1)
  end
  
  test "scccessful edit" do
    get edit_post_path(@post)
    assert_template 'posts/edit'
    name = "example name1"
    text = "example text1"
    content = "example content1"
    image = "example image1"
    patch post_path(@post), params: {post: {name: name, text: text, content: content, image: image}}
    assert_not flash.empty?
    assert_redirected_to @post
    @post.reload
    assert_equal name, @post.name
    assert_equal text, @post.text
    assert_equal content, @post.content
    assert_equal image, @post.image
  end
  
    
  test "unsuccessful edit" do
    get edit_post_path(@post)
    patch post_path(@post), params: { post: {content: ""}}
    assert_redirected_to @post
  end
end
