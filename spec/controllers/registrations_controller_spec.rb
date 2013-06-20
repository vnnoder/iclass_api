require 'spec_helper'

describe "Registration" do
  describe "POST /api/sign_up" do
    specify "User should be able to sign up" do
      data = {"user[username]" => "test", "user[password]" => "test12345", "user[password_confirmation]" => "test12345"}
      post("/api/sign_up", data)
      response.status.should eq(200)
    end
  end
end