class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :question_id, :user_id
end
