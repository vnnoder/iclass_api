class User < ActiveRecord::Base
  attr_accessible :created_at, :name, :password, :updated_at, :username
end
