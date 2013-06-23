
def sign_in_request
  @user = FactoryGirl.create(:user)
  data = {"user_login[username]" => @user.username, "user_login[password]" => @user.password}
  response = post("/api/sign_in", data)
  puts response
end


def sign_in_with_token
  @user = FactoryGirl.create(:user)
  sign_in @user
  @user.ensure_authentication_token!
  @auth_token = @user.reload.authentication_token
end