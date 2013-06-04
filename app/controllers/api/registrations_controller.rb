class Api::RegistrationsController < Api::BaseController

  def create

      user = User.new(params[:user])
      if user.save
        render :json=> {:success => TRUE_VALUE, :user => user.as_json(:auth_token=>user.authentication_token, :username=>user.username)}, :status=>200
        return
      else
        warden.custom_failure!
        render :json=> {:success => FALSE_VALUE, :message => user.errors}, :status=>422
      end

  end
end
