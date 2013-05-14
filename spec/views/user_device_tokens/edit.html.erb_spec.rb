require 'spec_helper'

describe "user_device_tokens/edit" do
  before(:each) do
    @user_device_token = assign(:user_device_token, stub_model(UserDeviceToken,
      :user => "",
      :device_token => "MyString"
    ))
  end

  it "renders the edit user_device_token form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_device_token_path(@user_device_token), "post" do
      assert_select "input#user_device_token_user[name=?]", "user_device_token[user]"
      assert_select "input#user_device_token_device_token[name=?]", "user_device_token[device_token]"
    end
  end
end
