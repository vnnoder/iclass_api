require 'spec_helper'

describe "options/edit" do
  before(:each) do
    @option = assign(:option, stub_model(Option,
      :content => "MyText",
      :survey => ""
    ))
  end

  it "renders the edit option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", option_path(@option), "post" do
      assert_select "textarea#option_content[name=?]", "option[content]"
      assert_select "input#option_survey[name=?]", "option[survey]"
    end
  end
end
