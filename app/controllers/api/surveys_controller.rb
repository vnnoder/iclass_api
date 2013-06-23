class Api::SurveysController < Api::BaseController
  ensure_param_exists :auth_token, :talk_id
  before_filter :ensure_talk_id_exists
  before_filter :ensure_auth_token_exists, :only =>[:create]
  def create
    begin
      talk = Talk.find params[:talk_id]
      survey = Survey.new(params[:survey])
      survey.talk_id = talk.id
      if survey.save
        render :json => {:success => TRUE_VALUE, :survey => survey}, :status => 200
      else
        render :json => {:success => FALSE_VALUE, :message => "unable to create survey"}, :status => 422
      end
    rescue ActiveRecord::RecordNotFound
      render :json => {:success => FALSE_VALUE, :message => "unable to find talk with id #{params[:talk_id]}"}, :status => 422
    end
  end
end