require 'spec_helper'

describe Api::SurveysController do
  before (:each) do
    sign_in_with_token

    @talk = FactoryGirl.create(:talk, :user => @user)
  end

  describe "POST /api/talk/:id/surveys/create" do
    it "should not be created if authentication token is not provided" do
      post :create, :talk_id => @talk.id,:survey => FactoryGirl.attributes_for(:free_text_survey)
      JSON.parse(response.body)["success"].should eq("false")
    end

    it "should return error if talk doesn't exist" do
      post :create, :talk_id => @talk.id + 1,:survey => FactoryGirl.attributes_for(:free_text_survey), :auth_token => @auth_token
      puts response.body
      JSON.parse(response.body)["success"].should eq("false")
    end

    it "should be created for free-text without option" do
      post :create, :talk_id => @talk.id,:survey => FactoryGirl.attributes_for(:free_text_survey), :auth_token => @auth_token
      puts response.body
      JSON.parse(response.body)["success"].should eq("true")
    end

    it "should not be created for multiple choice without option" do
      post :create, :talk_id => @talk.id,:survey => FactoryGirl.attributes_for(:multiple_choices_survey, :options_count => 0), :auth_token => @auth_token
      puts response.body
      JSON.parse(response.body)["success"].should eq("false")
    end

    it "should not be created for multiple choice with only 1 option" do
      post :create, :talk_id => @talk.id,:survey => FactoryGirl.attributes_for(:multiple_choices_survey, :options_count => 1), :auth_token => @auth_token
      puts response.body
      JSON.parse(response.body)["success"].should eq("false")
    end

    it "should be created for multiple choice with 2 options" do
      #Factory Girl not support has_many with before save
      survey = Survey.new(:survey_type => Survey::MULTIPLE_CHOICES, :question => "What is TDD?")
      survey.options << Option.new(:content => "Test-Driven Development")
      survey.options << Option.new(:content => "Time Difference Donation")
      options_attributes = survey.options.inject([]) {|sum, ele| sum << {:content => ele.content}}
      survey_hash = {:talk_id => @talk.id, :question => survey.question, :survey_type => survey.survey_type, :options_attributes => options_attributes}

      post :create, :talk_id => @talk.id,:survey => survey_hash, :auth_token => @auth_token
      puts response.body
      JSON.parse(response.body)["success"].should eq("true")
    end
  end
end
