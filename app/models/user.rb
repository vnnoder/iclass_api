class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable,:token_authenticatable, :recoverable
           #:validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :authentication_token
  attr_accessible :name, :password, :username

  has_many :questions
  has_many :talks
  has_many :attendances
  has_many :attended_talks, :class_name => Talk, :through => :attendances, :source => :talk
  has_many :votes
  has_one :user_device_token

  validates_presence_of :username

  def joined?(talk)
    Attendance.where(:talk_id => talk.id, :user_id => self.id).count > 0
  end

  def owned?(talk)
    talk.user_id == self.id
  end

  def as_json(options={})
    super(:except =>[:password, :password_confirmation, :remember_me])
  end
end
