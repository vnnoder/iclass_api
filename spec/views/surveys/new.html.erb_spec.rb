require 'spec_helper'

describe "surveys/new" do
  before(:each) do
    assign(:survey, stub_model(Survey,
      :type => "",
      :question => "MyText",
      :talk => ""
    ).as_new_record)
  end

  it "renders new survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", surveys_path, "post" do
      assert_select "input#survey_type[name=?]", "survey[type]"
      assert_select "textarea#survey_question[name=?]", "survey[question]"
      assert_select "input#survey_talk[name=?]", "survey[talk]"
    end
  end
end
