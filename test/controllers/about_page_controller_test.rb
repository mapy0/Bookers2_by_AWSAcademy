require 'test_helper'

class AboutPageControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_page_about_url
    assert_response :success
  end

  test "should get get" do
    get about_page_get_url
    assert_response :success
  end

end
