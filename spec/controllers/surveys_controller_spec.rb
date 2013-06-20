require 'spec_helper'

describe "Surveys" do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @user.ensure_authentication_token!

    @auth_token = @user.reload
    @talk = FactoryGirl.create(:talk, :user => @user)
  end

  describe "POST /api/talks/:id/surveys/" do
    it "should be able to create a new survey" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      data = {"talk[title]" => "New Title", "talk[description]" => "New Description", "auth_token" => @auth_token}
      post("/api/talks/#{@talk.id}/surveys",data)
      response.status.should eq(200)
    end
  end
end
