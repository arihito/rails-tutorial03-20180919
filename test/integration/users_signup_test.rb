require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  # 間違った入力値で最初と最後にUser数に違いがないかをテスト
  
  test "invalid signup information" do 

    get signup_path
    
    assert_no_difference 'User.count' do
      
      post users_path, params: {
        user: {
          name:                  "", 
          email:                 "user@invalid",
          password:              "foo",
          password_confirmation: "bar"
        }
      }
    end
  
    assert_template 'users/new'
    assert_select   'div#error_explanation'
    assert_select   'div.alert-danger'
    assert_select   'form[action="/signup"]'
    
  end
  
  
  # 正しい入力値で最初と最後に比較しUserが１追加されているテスト
  
  test "valid signup information" do
    
    get signup_path
    
    assert_difference 'User.count', 1 do
      
      post users_path, params: {
        
        user: {
          name:                  "Example User",
          email:                 "user@example.com",
          password:              "password",
          password_confirmation: "password"
        }
      }
    end
    
    # リダイレクト後に移動先のルーティングとアクションを確認
    follow_redirect!
    assert_template 'users/show'
    
    # フラッシュのテスト
    assert_not flash.empty?
    
  end
  
end