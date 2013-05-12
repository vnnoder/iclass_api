class Api::BaseController < ApplicationController
  TRUE_VALUE = "true"
  FALSE_VALUE = "false"

  include JsonRescuable
  respond_to :json
end