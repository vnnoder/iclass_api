class UserDeviceToken < ActiveRecord::Base
  belongs_to :user
  attr_accessible :device_token, :user, :user_id
end
