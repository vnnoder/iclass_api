require 'spec_helper'

describe "Talks" do
  before (:each) do
    @user = FactoryGirl.create(:user)
    data = {"user_login[username]" => @user.username, "user_login[password]" => @user.password}
    post("/api/sign_in", data)
    @auth_token = JSON.parse(response.body)["auth_token"]
  end

  specify "User can create a new talk" do
    data = {"talk[title]" => "New Title", "talk[description]" => "New Description", "auth_token" => @auth_token}
    post("/api/talks",data)
    response.status.should eq(200)
  end

  context "Existing talks" do
    before (:each) do
      @talk = FactoryGirl.create(:talk, :user => @user)
    end

    specify "User can find course by passcode" do
      data = {"talk[title]" => "New Title", "talk[description]" => "New Description", "auth_token" => @auth_token}
      get("/api/talks/passcode/#{@talk.passcode}")
      response.status.should eq(200)
    end
  end
end