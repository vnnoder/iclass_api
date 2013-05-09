require 'spec_helper'

describe "attendances/index" do
  before(:each) do
    assign(:attendances, [
      stub_model(Attendance,
        :user => "",
        :talk => ""
      ),
      stub_model(Attendance,
        :user => "",
        :talk => ""
      )
    ])
  end

  it "renders a list of attendances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
