class Talk < ActiveRecord::Base
  has_many :questions	
  belongs_to :user
  has_many :attendances
  has_many :attended_users, :class_name => User, :through => :attendances, :source => :user
  has_many :surveys

  before_create :generate_passcode

  attr_accessible :description, :end_time, :start_time, :status, :title, :user_id, :passcode, :location

  scope :pending, where(:status => 'pending')
  scope :open, where(:status => 'open')
  scope :closed, where(:status => 'closed')

  def as_json(options={})
    super
  end

  def close
    self.status = 'closed'
    self.end_time = Time.now
    result = self.save
    self.push_notification rescue nil
    result
  end

  def push_notification
    pusher = Grocer.pusher(
        certificate: "config/certs/certificate.pem",      # required
        passphrase:  "",                       # optional
        #gateway: "localhost",
        #gateway:     "gateway.push.apple.com", # optional; See note below.
        gateway:     "gateway.sandbox.push.apple.com.", # optional; See note below.
        port:        2195,                     # optional
        retries:     3                         # optional
    )
    self.attended_users.each do |user|
      if user.user_device_token.device_token
        puts user.user_device_token.device_token
        notification = Grocer::Notification.new(
            device_token: user.user_device_token.device_token,
            alert:        "#{self.title} has ended! Thanks for your time",
            badge:        1,
            #sound:        "siren.aiff",         # optional
            expiry:       Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
            identifier:   1234                  # optional
        )
        pusher.push(notification)
      end
    end

  end

  private
  def generate_passcode
    self.passcode = SecureRandom.hex(3)
  end

end
