require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "地元あい"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "サービス紹介 | 地元あい"
  end

 test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "お問合せ | 地元あい"
  end
end
