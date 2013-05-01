class Session < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :end_date, :name, :start_date, :status, :user_id
  has_many :questions
end
