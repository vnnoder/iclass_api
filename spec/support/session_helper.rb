#require File.expand_path("../http_helper", __FILE__)
#
#def sign_in()
#  @user = FactoryGirl.create(:user)
#  data = {"user_login[username]" => @user.username, "user_login[password]" => @user.password}
#  response = post("/api/sign_in", data)
#end