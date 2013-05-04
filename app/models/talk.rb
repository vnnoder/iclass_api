class Talk < ActiveRecord::Base
  has_many :questions	
  belongs_to :user
  attr_accessible :description, :end_date, :start_date, :status, :title, :user_id
end
