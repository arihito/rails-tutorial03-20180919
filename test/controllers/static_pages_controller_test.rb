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
    get static_pages_home_url
    assert_response :success
    assert_select "title","Home | #{@base_title}"
  end

  test "should get method to help action" do
    get static_pages_help_url
    assert_response :success
    assert_select "title","Help | #{@base_title}"
  end

  test "should get method to about action" do
    get static_pages_about_url
    assert_response :success
    assert_select "title","About | #{@base_title}"
  end
  
  test "should get method to contact action" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title","Contact | #{@base_title}"
  end
end
