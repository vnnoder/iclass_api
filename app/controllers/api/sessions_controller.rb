class Api::SessionsController < Api::BaseController
  before_filter :authenticate_user!, :except => [:create, :destroy]
  before_filter :ensure_params_exist

  def create
    resource = User.find_for_database_authentication(:username => params[:user_login][:username])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user_login][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success => TRUE_VALUE, :auth_token=>resource.authentication_token, :user => resource}, :status => 200
      return
    end
    invalid_login_attempt
  end

  def destroy
    resource = User.find_for_database_authentication(:username => params[:user_login][:username])
    return not_exists_user unless resource
    resource.authentication_token = nil
    resource.save
    render :json=> {:success => TRUE_VALUE}, :status => 200
  end

  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success => FALSE_VALUE, :message=>"missing user_login parameter"}, :status=>422
  end

  def invalid_login_attempt
    render :json=> {:success => FALSE_VALUE, :message=>"Error with your login or password"}, :status=>401
  end

  def not_exists_user
    render :json=> {:success => FALSE_VALUE, :message=>"Invalid username"}, :status=>401
  end

end
