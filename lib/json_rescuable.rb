module JsonRescuable
  extend ActiveSupport::Concern
  included do
    rescue_from Exception do |exception|
      render :json => {:success => "false", :message => exception.message}, :status => 424
    end
  end
end