require 'spec_helper'

describe "Sessions" do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "POST /api/sign_in" do
    specify "User should be able to sign in" do
      data = {"user_login[username]" => @user.username, "user_login[password]" => @user.password}
      post("/api/sign_in", data)
      response.status.should eq(200)
    end
  end

end