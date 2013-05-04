class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :talk
  attr_accessible :detail, :title, :user_id, :talk_id
end
