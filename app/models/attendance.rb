class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :talk

  attr_accessible :end_time, :start_time, :talk_id, :user_id
  def as_json(options={})
    super()
  end
end
