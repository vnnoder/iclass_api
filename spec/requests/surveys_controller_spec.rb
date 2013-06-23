require 'spec_helper'

describe "Survey" do
  before (:each) do
    @user = FactoryGirl.create(:user)
    data = {"user_login[username]" => @user.username, "user_login[password]" => @user.password}
    response = post("/api/sign_in", data)
    puts response
    @talk = FactoryGirl.create(:talk, :user => @user)
  end

  it "should be able to create a free-text survey via web service" do
    data = FactoryGirl.attributes_for(:free_text_survey).inject({}) do |data_hash,attribute|
      data_hash["survey[#{attribute}]"] = attribute
    end
    post("/api/talk/#{@talk.id}/surveys", data)
    puts response
  end
end