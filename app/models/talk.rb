class Talk < ActiveRecord::Base
  has_many :questions	
  belongs_to :user
  has_many :attended_users, :class_name => User, :through => :attendances, :source => :user

  before_create :generate_passcode

  attr_accessible :description, :end_time, :start_time, :status, :title, :user_id, :passcode

  private
  def generate_passcode
    self.passcode = SecureRandom.hex(3)
  end
end
