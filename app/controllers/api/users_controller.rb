class Api::UsersController < Api::BaseController
  before_filter :authenticate_user!
  before_filter :ensure_params_exist, :only => :update_device_token

  def ensure_params_exist
    return unless params[:device_token].blank?
    render :json=>{:success => FALSE_VALUE, :message=>"missing device token parameter"}, :status=>422
  end

  def update_device_token
    if current_user.nil?
      render :json => {:success => FALSE_VALUE, :message => "user not logged in"}, :status => 401
    else
      device_token = current_user.user_device_token || UserDeviceToken.new(:user_id => current_user.id)
      device_token.device_token = params[:device_token]
      if device_token.save
        render :json => {:success => TRUE_VALUE, :device_token => device_token}, :status => 200
      else
        render :json => {:success => FALSE_VALUE, :message => "Unable to update device token"}, :status => 422
      end
    end
  end

end