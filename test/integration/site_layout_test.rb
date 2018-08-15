require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layouts links" do
    
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count:2
    assert_select "a[href=?]", help_path, text: "Help"
    assert_select "a[href=?]", "#", text: "Log in"
    assert_select "a[href=?]", about_path, text: "About"
    assert_select "a[href=?]", contact_path, text: "Contact"
    assert_select "a[href=?]", "http://news.railstutorial.org/", text: "News"

    get contact_path
    assert_select "title", full_title("Contact")
    
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end
