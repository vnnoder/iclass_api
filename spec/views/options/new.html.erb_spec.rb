require 'spec_helper'

describe "options/new" do
  before(:each) do
    assign(:option, stub_model(Option,
      :content => "MyText",
      :survey => ""
    ).as_new_record)
  end

  it "renders new option form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", options_path, "post" do
      assert_select "textarea#option_content[name=?]", "option[content]"
      assert_select "input#option_survey[name=?]", "option[survey]"
    end
  end
end
