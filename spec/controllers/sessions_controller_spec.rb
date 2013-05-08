require 'spec_helper'
describe Api::SessionsController do
  before (:each) do
    @user = FactoryGirl.create(:user)
  end
  context "Sign In" do
    it "should return user json when sign in" do
      User.count.should == 1
      user_login = {"username" => @user.username, "password" => @user.password}
      print user_login
      post :create, :user_login => user_login
      print response.body

      #Sign IN
      #url = URI.parse('http://localhost:3000/api/sign_in')
      #req = Net::HTTP::Post.new(url.path)
      #req.set_form_data({"user_login[username]" => "test", "user_login[password]" => "test12345"})
      #res = Net::HTTP.start(url.host, url.port) {|http|
      #  http.request(req)
      #}
      #puts res.body
    end
  end

  context "Sign Out" do
    it "should delete authentication token when sign out" do
      ##Sign out
      #require 'net/http'
      #url = URI.parse('http://localhost:3000/api/sign_out')
      #pust "url.path = #{url.path} \t url.port = #{url.port}"
      #req = Net::HTTP::Delete.new(url.path)
      #req.set_form_data({"user_login[username]" => "test"})
      #res = Net::HTTP.start(url.host, url.port) {|http|
      #  http.request(req)
      #}
      #puts res.body
    end
  end
end