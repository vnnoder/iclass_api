require 'spec_helper'

describe "surveys/edit" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :type => "",
      :question => "MyText",
      :talk => ""
    ))
  end

  it "renders the edit survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", survey_path(@survey), "post" do
      assert_select "input#survey_type[name=?]", "survey[type]"
      assert_select "textarea#survey_question[name=?]", "survey[question]"
      assert_select "input#survey_talk[name=?]", "survey[talk]"
    end
  end
end
