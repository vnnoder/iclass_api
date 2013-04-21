class Session < ActiveRecord::Base
  attr_accessible :description, :end_date, :name, :start_date, :status
end
