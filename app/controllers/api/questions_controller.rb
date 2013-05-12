class Api::QuestionsController < Api::BaseController
  before_filter :authenticate_user!
  before_filter :ensure_can_load_talk, :ensure_user_joined_talk
  before_filter :ensure_can_load_question, :only => :vote
  before_filter :ensure_valid_question, :only => :vote
  before_filter :ensure_params_exist, :only => :create

  def ensure_can_load_talk
    begin
      if params[:talk_id].blank?
        render :json=>{:success => FALSE_VALUE, :message=>"missing talk id"}, :status=>422
      else
        @talk = Talk.find params[:talk_id]
      end
    rescue
      render :json => {:success => FALSE_VALUE, :message => "unable to find talk"}, :status => 422
    end
  end

  def ensure_can_load_question
    begin
      if params[:id].blank?
        render :json=>{:success => FALSE_VALUE, :message=>"missing question id"}, :status=>422
      else
        @question = Question.find params[:id]
      end
    rescue
      render :json => {:success => FALSE_VALUE, :message => "unable to find question"}, :status => 422
    end
  end

  def ensure_valid_question
    if @question.talk_id != @talk.id
      render :json=>{:success => FALSE_VALUE, :message=>"question do not belong to the specific talk"}, :status=>422
    else
      unless current_user.joined?(@question.talk)
        render :json=>{:success => FALSE_VALUE, :message=>"user cannot vote for question belongs to talk that they don't join"}, :status=>422
      end
    end
  end

  def ensure_user_joined_talk
    return if current_user.joined?(@talk)
    render :json => {:success => FALSE_VALUE, :message => "user has not joined talk"}, :status => 422
  end

  def ensure_params_exist
    return unless params[:question].blank? or params[:question][:title].blank?
    render :json=>{:success => FALSE_VALUE, :message=>"missing question parameter"}, :status=>422
  end

  def index
    if current_user
      render :json => {:success => TRUE_VALUE, :questions => @talk.questions}, :status => 200
    else
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    end
  end

  def create
    if current_user.nil?
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    else
      question = Question.new(params[:question])
      question.user = current_user
      question.talk = @talk

      if question.save
        render :json => {:success => TRUE_VALUE, :question => question}, :status => 200
      else
        render :json => {:success => FALSE_VALUE, :message => "unable to create question"}, :status => 422
      end
    end
  end

  def vote
    if current_user.nil?
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    elsif @question.user_id == current_user.id
      render :json => {:success => FALSE_VALUE, :message => "you cannot vote for your own question"}, :status => 422
    elsif Vote.where(:question_id => @question.id, :user_id => current_user.id).first
      render :json => {:success => FALSE_VALUE, :message => "user already voted for this question"}, :status => 424
    else
      vote = Vote.create(:question_id => @question.id, :user_id => current_user.id)
      if vote
        render :json => {:success => TRUE_VALUE, :vote => vote}, :status => 200
      else
        render :json => {:success => FALSE_VALUE, :message => "unable to vote for question"}, :status => 422
      end
    end
  end

end