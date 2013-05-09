class Api::TalksController < Api::BaseController
  before_filter :authenticate_user!
  before_filter :ensure_params_exist, :only => :create

  def ensure_params_exist
    return unless params[:talk].blank? or params[:talk][:title].blank?
    render :json=>{:success=>false, :message=>"missing talk parameter"}, :status=>422
  end

  def index
    if current_user
      render :json => {:success => true, :talks => current_user.talks.to_json}, :status => 200
    else
      render :json => {:success => false, :message => "user not logged in"}, :status => 401
    end
  end

  def create
     if current_user
       talk = Talk.new()
       talk.title = params[:talk][:title]
       talk.description = params[:talk][:description]
       talk.user = current_user
       talk.status = 'pending'
       talk.save
       unless talk.new_record?
         render :json => {:success => true, :talk => talk.to_json}, :status => 200
       else
        render :json => {:success => false, :message => "unable to create talk"}, :status => 422
       end
     else
      render :json => {:success => false, :message => "user not logged in"}, :status => 401
     end
  end

  def join
    begin
      if current_user
        talk_id = params[:id]
        talk = Talk.find talk_id

        attendance = Attendance.find_or_create_by_user_id_and_talk_id(:user_id => current_user.id, :talk_id => talk_id) do |record|
          record.start_time = Time.now
        end
        unless attendance.new_record?
          render :json => {:success => true, :attendance => attendance.to_json}, :status => 200
        else
          render :json => {:success => false, :message => "unable to join talk"}, :status => 422
        end
      else
        render :json => {:success => false, :message => "user not logged in"}, :status => 401
      end
    rescue ActiveRecord::RecordNotFound
      render :json => {:success => false, :message => "unable to find talk"}, :status => 422
    end
  end

  def joined_talks
    if current_user
      render :json => {:success => true, :talks => current_user.attended_talks.to_json}, :status => 200
    else
      render :json => {:success => false, :message => "user not logged in"}, :status => 401
    end
  end
end