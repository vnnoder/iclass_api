class Api::BaseController < ApplicationController
  include JsonRescuable
  respond_to :json
end