class Talk < ActiveRecord::Base
  has_many :questions	
  belongs_to :user
  has_many :attended_users, :class_name => User, :through => :attendances, :source => :user

  attr_accessible :description, :end_time, :start_time, :status, :title, :user_id
end
