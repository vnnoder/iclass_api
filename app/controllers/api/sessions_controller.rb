class Api::SessionsController < Api::BaseController
  before_filter :authenticate_user!, :except => [:create, :destroy]
  before_filter :ensure_params_exist

  def create
    resource = User.find_for_database_authentication(:username => params[:user_login][:username])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user_login][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :user => resource.to_json}
      return
    end
    invalid_login_attempt
  end

  def destroy
    resource = User.find_for_database_authentication(:username => params[:user_login][:username])
    return not_exists_user unless resource
    resource.authentication_token = nil
    resource.save
    render :json=> {:success=>true}
  end

  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end

  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end

  def not_exists_user
    render :json=> {:success=>false, :message=>"Invalid username"}, :status=>401
  end

end
