require 'test_helper'

class PostsRegisterTest < ActionDispatch::IntegrationTest
  
  test "invalid posts register" do
    get new_post_path
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: {content: ""}}
    end
    assert_not flash.empty?
    assert_template 'posts/new'
  end
  
  test "valid posts register" do
    get new_post_path
    assert_no_difference 'Post.count' , 1 do
      post posts_path, params: { post: {content: "Example post"}}
    end
    assert_template 'posts/new'
    assert_not flash.empty?
  end

end
