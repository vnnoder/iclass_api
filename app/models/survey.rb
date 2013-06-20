class Survey < ActiveRecord::Base
  MULTIPLE_CHOICES = 1
  FREE_TEXT = 2
  attr_accessible :question, :talk, :survey_type
  belongs_to :talk
  has_many :options

  before_save :must_have_at_least_two_options

  accepts_nested_attributes_for :options

  def must_have_at_least_two_options
    return false if options.size < 2 and survey_type == MULTIPLE_CHOICES
  end
end
