require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Third"
  end
  
  test "should get method to new action" do
    get signup_path
    assert_select "title", "Sign up | #{@base_title}"
  end

end
