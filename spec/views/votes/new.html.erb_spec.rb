require 'spec_helper'

describe "votes/new" do
  before(:each) do
    assign(:vote, stub_model(Vote,
      :question => "",
      :user => ""
    ).as_new_record)
  end

  it "renders new vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", votes_path, "post" do
      assert_select "input#vote_question[name=?]", "vote[question]"
      assert_select "input#vote_user[name=?]", "vote[user]"
    end
  end
end
