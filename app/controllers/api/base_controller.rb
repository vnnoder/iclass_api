class Api::BaseController < ApplicationController
  TRUE_VALUE = "true"
  FALSE_VALUE = "false"

  include JsonRescuable
  respond_to :json

  def self.ensure_param_exists(*param_names)
    param_names.each do |param_name|
      define_method("ensure_#{param_name}_exists".to_sym) do
        return unless params[param_name.to_sym].blank?
        render :json=>{:success => FALSE_VALUE, :message=>"missing #{param_name} parameter"}, :status=>422
      end
    end
  end
end