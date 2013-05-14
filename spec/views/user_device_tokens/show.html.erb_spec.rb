require 'spec_helper'

describe "user_device_tokens/show" do
  before(:each) do
    @user_device_token = assign(:user_device_token, stub_model(UserDeviceToken,
      :user => "",
      :device_token => "Device Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Device Token/)
  end
end
