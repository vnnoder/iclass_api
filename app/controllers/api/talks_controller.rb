class Api::TalksController < Api::BaseController
  before_filter :authenticate_user!
  before_filter :ensure_params_exist, :only => :create
  before_filter :ensure_id_exists, :only => [:start, :join]
  before_filter :ensure_can_load_talk, :only => [:start, :join, :close]

  def ensure_params_exist
    return unless params[:talk].blank? or params[:talk][:title].blank?
    render :json=>{:success => FALSE_VALUE, :message=>"missing talk parameter"}, :status=>422
  end

  def ensure_id_exists
    return unless params[:id].blank?
    render :json=>{:success => FALSE_VALUE, :message=>"missing talk parameter"}, :status=>422
  end

  def ensure_can_load_talk
    begin
      @talk = Talk.find params[:id]
    rescue
      render :json => {:success => FALSE_VALUE, :message => "unable to find talk"}, :status => 422
    end
  end

  def index
    if current_user
      render :json => {:success => TRUE_VALUE, :talks => current_user.talks}, :status => 200
    else
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    end
  end

  def get_by_passcode
    if params[:passcode].nil?
      render :json => {:success => FALSE_VALUE, :message => "missing passcode parameter"}, :status => 422
    else
      talk = Talk.find_by_passcode params[:passcode]
      if talk
        render :json => {:success => TRUE_VALUE, :talk => talk}, :status => 200
      else
        render :json => {:success => FALSE_VALUE, :message => "passcode not found"}, :status => 422
      end
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
         render :json => {:success => TRUE_VALUE, :talk => talk}, :status => 200
       else
        render :json => {:success => FALSE_VALUE, :message => "unable to create talk"}, :status => 422
       end
     else
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
     end
  end

  def start
    if current_user
      if @talk.user.id != current_user.id
        render :json => {:success => FALSE_VALUE, :message => "talk do not belong to user"}, :status => 401
      else
        if @talk.status == 'open'
          render :json => {:success => FALSE_VALUE, :message => "talk already open"}, :status => 424
        else
          @talk.status = 'open'
          @talk.start_time = Time.now
          if @talk.save
            render :json => {:success => TRUE_VALUE, :talk => @talk}, :status => 200
          else
            render :json => {:success => FALSE_VALUE, :message => "unable to start talk"}, :status => 422
          end
        end
      end
    else
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    end
  end

  def close
    if current_user
      if @talk.user.id != current_user.id
        render :json => {:success => FALSE_VALUE, :message => "talk do not belong to user"}, :status => 401
      else
        if @talk.status == 'closed'
          render :json => {:success => FALSE_VALUE, :message => "talk already closed"}, :status => 424
        else
          @talk.status = 'closed'
          @talk.end_time = Time.now
          if @talk.save
            render :json => {:success => TRUE_VALUE, :talk => @talk}, :status => 200
          else
            render :json => {:success => FALSE_VALUE, :message => "unable to end talk"}, :status => 422
          end
        end
      end
    else
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    end
  end

  def join
    if current_user
      attendance = Attendance.find_or_create_by_user_id_and_talk_id(:user_id => current_user.id, :talk_id => @talk.id) do |record|
        record.start_time = Time.now
      end
      unless attendance.new_record?
        render :json => {:success => TRUE_VALUE, :attendance => attendance}, :status => 200
      else
        render :json => {:success => FALSE_VALUE, :message => "unable to join talk"}, :status => 422
      end
    else
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    end
  end

  def joined_talks
    if current_user
      render :json => {:success => TRUE_VALUE, :talks => current_user.attended_talks}, :status => 200
    else
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    end
  end
end