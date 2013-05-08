class Api::TalksController < Api::BaseController
  before_filter :authenticate_user!, :ensure_params_exist

  def ensure_params_exist
    return unless params[:talk].blank? or params[:talk][:title].blank?
    render :json=>{:success=>false, :message=>"missing talk parameter"}, :status=>422
  end

  def create
     if current_user
       talk = Talk.new()
       talk.title = params[:talk][:title]
       talk.description = params[:talk][:description]
       talk.user = current_user
       talk.status = 'pending'
       talk.save
     end
    unless talk.new_record?
      render :json => {:success => true, :talk => talk.to_json}
    end
  end
end