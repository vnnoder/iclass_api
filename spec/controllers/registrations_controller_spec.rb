require 'spec_helper'
describe Api::RegistrationsController do
  context "Sign Up" do
    it "should allow user to sign up" do
      user = {"username" => "test", "password" => "secret", "password_confirmation" => "secret"}
      post :create, :user => user

      print response.body
    end
  end
end
