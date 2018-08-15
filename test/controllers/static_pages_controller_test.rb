require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Third"
  end

  test "should get method to root path" do
    get root_url
    assert_response :success
  end

  test "should get method to home action" do
    get root_path
    assert_response :success
    assert_select "title","#{@base_title}"
  end

  test "should get method to help action" do
    get help_path
    assert_response :success
    assert_select "title","Help | #{@base_title}"
  end

  test "should get method to about action" do
    get about_path
    assert_response :success
    assert_select "title","About | #{@base_title}"
  end
  
  test "should get method to contact action" do
    get contact_path
    assert_response :success
    assert_select "title","Contact | #{@base_title}"
  end

end
