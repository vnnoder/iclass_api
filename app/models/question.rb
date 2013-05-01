class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :session
  attr_accessible :created_at, :detail, :title, :updated_at, :user_id, :session_id  
end
