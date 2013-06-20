class Option < ActiveRecord::Base
  attr_accessible :content, :survey
  belongs_to :survey
end
