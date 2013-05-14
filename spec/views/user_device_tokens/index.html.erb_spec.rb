require 'spec_helper'

describe "user_device_tokens/index" do
  before(:each) do
    assign(:user_device_tokens, [
      stub_model(UserDeviceToken,
        :user => "",
        :device_token => "Device Token"
      ),
      stub_model(UserDeviceToken,
        :user => "",
        :device_token => "Device Token"
      )
    ])
  end

  it "renders a list of user_device_tokens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Device Token".to_s, :count => 2
  end
end
