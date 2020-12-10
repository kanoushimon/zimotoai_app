require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:post1)
  end

  test "should get new" do
    get new_post_path
    assert_response :success
  end
  
  test "valid destroy" do
    assert_no_difference 'User.count' do
      delete post_path(@post)
    end
    assert_redirected_to root_url
  end
  
end