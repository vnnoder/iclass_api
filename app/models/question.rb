class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :talk
  has_many :votes

  attr_accessible :detail, :title, :user_id, :talk_id

  scope :question_with_vote_count, joins(<<-SQL
    LEFT JOIN votes v on v.question_id = questions.id
  SQL
  ).select("questions.*,count(distinct(v.user_id)) as vote_count")

  def vote_count
    self.votes.group_by(&:user_id).count
  end

  def as_json(options={})
    origin = super
    origin[:vote_count] = self.vote_count
    origin
  end

end
