require 'spec_helper'

describe "Survey" do
  context "Free Text" do
    subject {Survey.new(:survey_type => Survey::FREE_TEXT, :question => "What can be done to improve this course?")}

    it { should be_valid }

    it "should be able to create a free-text survey without options" do
      expect {subject.save}.to change{subject.class.count}.by(1)
    end
  end

  context "Multiple choices" do
    subject {Survey.new(:survey_type => Survey::MULTIPLE_CHOICES, :question => "What is TDD?")}

    it {should be_valid}

    it "should have at least two options for multiple choice type" do
      subject.options << Option.new(:content => "Test-Driven Development")
      subject.options << Option.new(:content => "Time Difference Donation")
      expect {subject.save}.to change {subject.class.count}.by(1)
    end

    it "should not allow multiple choice with 1 option" do
      subject.options << Option.new(:content => "Test-Driven Development")
      expect {subject.save}.to change {subject.class.count}.by(0)
    end

  end

end