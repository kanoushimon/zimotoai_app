require 'test_helper'

class PostsEditTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:sample_post)
  end
  
  test "unsuccessful edit" do
    get edit_post_path(@post)
    patch post_path(@post), params: { post: {content: ""}}
    assert_template 'posts/edit'
  end
  
  test "scccessful edit" do
    get edit_post_path(@post)
    assert_template 'posts/edit'
    content = "ここに行ってきました。"
    patch post_path(@post), params: {post: {content: content}}
    assert_not flash.empty?
    assert_redirected_to @post
    @post.reload
    assert_equal content, @post.content
  end
end
